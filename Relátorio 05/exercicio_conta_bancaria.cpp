#include <iostream>
#include <iomanip>
using namespace std;

int main() {
    float saldo;
    int opcao;
    float valor;
    
    cout << "Informe o saldo inicial da conta: R$ ";
    cin >> saldo;
    
    do {
        cout << "\n========== MENU DE OPÇÕES ==========" << endl;
        cout << "1. Ver Saldo" << endl;
        cout << "2. Depositar" << endl;
        cout << "3. Sacar" << endl;
        cout << "4. Sair" << endl;
        cout << "====================================" << endl;
        cout << "Escolha uma opção: ";
        cin >> opcao;
        
        switch(opcao) {
            case 1:
                cout << fixed << setprecision(2);
                cout << "Saldo atual: R$ " << saldo << endl;
                break;
                
            case 2:
                cout << "Digite o valor a depositar: R$ ";
                cin >> valor;
                if (valor > 0) {
                    saldo += valor;
                    cout << "Depósito realizado com sucesso!" << endl;
                    cout << "Novo saldo: R$ " << saldo << endl;
                } else {
                    cout << "Valor inválido!" << endl;
                }
                break;
                
            case 3:
                cout << "Digite o valor a sacar: R$ ";
                cin >> valor;
                
                if (valor > saldo) {
                    cout << "Saldo Insuficiente" << endl;
                } else if (valor > 0) {
                    saldo -= valor;
                    cout << "Saque realizado com sucesso!" << endl;
                    cout << "Novo saldo: R$ " << saldo << endl;
                } else {
                    cout << "Valor inválido!" << endl;
                }
                break;
                
            case 4:
                cout << "Encerrando o programa. Até logo!" << endl;
                break;
                
            default:
                cout << "Opção inválida! Tente novamente." << endl;
        }
        
    } while (opcao != 4);
    
    return 0;
}
