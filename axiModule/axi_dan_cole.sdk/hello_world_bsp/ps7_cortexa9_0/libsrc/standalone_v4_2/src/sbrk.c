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
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* XILINX CONSORTIUM BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be used
* in advertising or otherwise to promote the sale, use or other dealings in
* this Software without prior written authorization from Xilinx.
*
******************************************************************************/

#include <errno.h>
#ifdef __cplusplus
extern "C" {
	__attribute__((weak)) char *sbrk (int nbytes);
}
#endif

extern char _heap_start[];
extern char _heap_end[];
extern char HeapBase[];
extern char HeapLimit[];

static char *heap_ptr;

__attribute__((weak)) char *sbrk (int nbytes)
{
  char *base;

  if (!heap_ptr)
    /*heap_ptr = (char *)&_heap_start;*/
    heap_ptr = (char *)&HeapBase;

  base = heap_ptr;
  heap_ptr += nbytes;

/*  if (heap_ptr <= ((char *)&_heap_end + 1))*/
  if (heap_ptr <= ((char *)&HeapLimit + 1))
    return base;

  else
  {
    errno = ENOMEM;
    return ((char *)-1);
  }
}
