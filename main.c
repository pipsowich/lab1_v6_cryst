int sum_array(int N, int M, int arr[N][M]) {
    int sum = 0;
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < M; j++) {
            sum += arr[i][j];
        }
    }
    return sum;
}
int main() {
    int N = 4;
    int M = 4;
    int matrix[4][4] = {
        {10,  22, 33,  4},
        {52,  64,  17,  8},
        {91,  10, 111, 3},
        {1, 14, 52, 31}
    };
    int result = sum_array(N, M, matrix);
    return result;
}
