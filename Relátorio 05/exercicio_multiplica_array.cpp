#include <iostream>
using namespace std;

float multiplicaArray(float arr[], int tamanho) {
    float produto = 1.0;
    
    for (int i = 0; i < tamanho; i++) {
        produto *= arr[i];
    }
    
    return produto;
}

int main() {
    int quantidade;
    
    cout << "Quantos valores você deseja inserir? ";
    cin >> quantidade;
    
    float arr[quantidade];
    
    cout << "Digite os " << quantidade << " valores:" << endl;
    for (int i = 0; i < quantidade; i++) {
        cout << "Valor " << (i + 1) << ": ";
        cin >> arr[i];
    }
    
    float resultado = multiplicaArray(arr, quantidade);
    cout << "O produto dos valores é: " << resultado << endl;
    
    return 0;
}
