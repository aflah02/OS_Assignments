

SYSCALL_DEFINE4(kernel_2d_memcpy, float *, dst, float *, src, int, row_count, int, col_count)
{
    float temp[row_count][col_count];
    int op1Failed = __copy_from_user(temp, src, sizeof(temp));
    if (op1Failed)
    {
        printk("copy_from_user failed to copy: look at internal implementation under SYSCALL_DEFINE4 for more details\n");
        return -1;
    }
    int op2Failed = __copy_to_user(dst, temp, sizeof(temp));
    if (op2Failed)
    {
        printk("copy_to_user failed to copy: look at internal implementation under SYSCALL_DEFINE4 for more details\n");
        return -1;
    }
    return 0;
}