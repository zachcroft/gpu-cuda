#include <stdio.h>

// The __global__ keyword is used to define
// functions (kernels) executed on the GPU,
// which can be called from the CPU. 
__global__ void hello_world()
{
    printf("Hello, World!\n");
}

int main()
{
    // Call the kernel. The <<<1, 1>>> syntax
    // indicates the # of blocks and # of threads:
    // <<< n_blocks, n_threads >>>
    hello_world<<<1, 1>>>();

    // Wait for all GPU processes to complete before
    // continuing program (analogous to MPI_Barrier)
    cudaDeviceSynchronize();

    return 0;
}

// Note: To compile this CUDA code, type 
//
//    nvcc hello_world.cu -o main
//
// This will generate the following files:
// 1) main.exe
// 2) main.exp
// 3) main.lib
// The exp and lib files are only needed during
// compilation and can be deleted. To run the code,
// type ./main
