int fib(int);
int main() {
	int *result = 0x0000;

	*result = fib(9);
	return 0;
}

int fib(int n) {
	if (n == 1 || n == 2)
		return 1;

	return fib(n - 1) + fib(n - 2);
}
