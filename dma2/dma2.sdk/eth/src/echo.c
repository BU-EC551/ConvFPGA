/******************************************************************************
*
* Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* Use of the Software is limited solely to applications:
* (a) running on a Xilinx device, or
* (b) that interact with a Xilinx device through a bus or interconnect.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
* XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be used
* in advertising or otherwise to promote the sale, use or other dealings in
* this Software without prior written authorization from Xilinx.
*
******************************************************************************/

#include <stdio.h>
#include <string.h>

#include "lwip/err.h"
#include "lwip/tcp.h"
#if defined (__arm__) || defined (__aarch64__)
#include "xil_printf.h"
#endif

#ifndef DDR_BASE_ADDR
#ifdef XPAR_AXI_7SDDR_0_S_AXI_BASEADDR
#define DDR_BASE_ADDR		XPAR_AXI_7SDDR_0_S_AXI_BASEADDR
#elif XPAR_MIG7SERIES_0_BASEADDR
#define DDR_BASE_ADDR	XPAR_MIG7SERIES_0_BASEADDR
#elif XPAR_MIG_0_BASEADDR
#define DDR_BASE_ADDR	XPAR_MIG_0_BASEADDR
#elif XPAR_PSU_DDR_0_S_AXI_BASEADDR
#define DDR_BASE_ADDR	XPAR_PSU_DDR_0_S_AXI_BASEADDR
#endif
#endif

#ifndef MEM_BASE_ADDR
#ifndef DDR_BASE_ADDR
#warning CHECK FOR THE VALID DDR ADDRESS IN XPARAMETERS.H, \
		DEFAULT SET TO 0x01000000
#define MEM_BASE_ADDR		0x01000000
#else
#define MEM_BASE_ADDR		(DDR_BASE_ADDR + 0x1000000)
#endif
#endif

#ifndef TX_BUFFER_BASE
#define TX_BUFFER_BASE		(MEM_BASE_ADDR + 0x00100000)
#endif

#ifndef TX_BUFFER_HIGH
#define TX_BUFFER_HIGH		(MEM_BASE_ADDR + 0x008FFFFF)
#endif

#ifndef RX_BUFFER_BASE
#define RX_BUFFER_BASE		(MEM_BASE_ADDR + 0x00900000)
#endif

#ifndef RX_BUFFER_HIGH
#define RX_BUFFER_HIGH		(MEM_BASE_ADDR + 0x010FFFFF)
#endif

#define NUM_INPUT_VALS 27

u32 *InputBufPtr = (u32 *) TX_BUFFER_BASE;
int count = 0;
char *str;

int transfer_data() {
	return count;
}

void print_app_header()
{
	xil_printf("\n\r\n\r-----lwIP TCP echo server ------\n\r");
	xil_printf("TCP packets sent to port 6001 will be echoed back\n\r");
}

err_t recv_callback(void *arg, struct tcp_pcb *tpcb,
                               struct pbuf *p, err_t err)
{
	/* do not read the packet if we are not in ESTABLISHED state */
	if (!p) {
		tcp_close(tpcb);
		tcp_recv(tpcb, NULL);
		return ERR_OK;
	}

	/* indicate that the packet has been received */
	tcp_recved(tpcb, p->len);

	/* echo back the payload */
	/* in this case, we assume that the payload is < TCP_SND_BUF */
//	if (tcp_sndbuf(tpcb) > p->len) {
//		err = tcp_write(tpcb, p->payload, p->len, 1);
//	} else
//		xil_printf("no space in tcp_sndbuf\n\r");
//		count = count+1;
//		test[count] = (int)((p->payload));
//		xil_printf("got %c", (p->payload));
		//xil_printf("%s\r\n",(p->payload));

		int i;
		u8* temptr;
		temptr = p->payload;
		for (i=0; i< p->len; i++) {
			str[i]=*temptr++;
		}
		str[i]='\0';

//		test[count] = atoi(str);
		*(InputBufPtr + count) = atoi(str);
		count++;

	/* free the received pbuf */
		if(count == NUM_INPUT_VALS){
			for (i = 0; i < NUM_INPUT_VALS; ++i) {
				xil_printf("inp_data[%d] = %d\r\n", i, InputBufPtr[i]);
			}
		}
	pbuf_free(p);

	return ERR_OK;
}

err_t accept_callback(void *arg, struct tcp_pcb *newpcb, err_t err)
{
	static int connection = 1;

	/* set the receive callback for this connection */
	tcp_recv(newpcb, recv_callback);

	/* just use an integer number indicating the connection id as the
	   callback argument */
	tcp_arg(newpcb, (void*)(UINTPTR)connection);

	/* increment for subsequent accepted connections */
	connection++;

	return ERR_OK;
}


int start_application()
{
	struct tcp_pcb *pcb;
	err_t err;
	unsigned port = 7;

	/* create new TCP PCB structure */
	pcb = tcp_new();
	if (!pcb) {
		xil_printf("Error creating PCB. Out of Memory\n\r");
		return -1;
	}

	/* bind to specified @port */
	err = tcp_bind(pcb, IP_ADDR_ANY, port);
	if (err != ERR_OK) {
		xil_printf("Unable to bind to port %d: err = %d\n\r", port, err);
		return -2;
	}

	/* we do not need any arguments to callback functions */
	tcp_arg(pcb, NULL);

	/* listen for connections */
	pcb = tcp_listen(pcb);
	if (!pcb) {
		xil_printf("Out of memory while tcp_listen\n\r");
		return -3;
	}

	/* specify callback to use for incoming connections */
	tcp_accept(pcb, accept_callback);

	xil_printf("TCP echo server started @ port %d\n\r", port);

	return 0;
}
