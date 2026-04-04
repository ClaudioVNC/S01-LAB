#include <iostream>
using namespace std;

int main() {
    int sala[5][5] = {0};
    int opcao;
    int fileira, coluna;
    
    do {
        cout << "\n========== SISTEMA DE RESERVAS ==========" << endl;
        cout << "1. Reservar Assento" << endl;
        cout << "2. Ver Mapa da Sala" << endl;
        cout << "3. Sair" << endl;
        cout << "=========================================" << endl;
        cout << "Escolha uma opção: ";
        cin >> opcao;
        
        switch(opcao) {
            case 1:
                cout << "Digite a fileira (0-4): ";
                cin >> fileira;
                cout << "Digite a coluna (0-4): ";
                cin >> coluna;
                
                if (fileira >= 0 && fileira < 5 && coluna >= 0 && coluna < 5) {
                    if (sala[fileira][coluna] == 0) {
                        sala[fileira][coluna] = 1;
                        cout << "Sucesso!" << endl;
                    } else {
                        cout << "Erro: Assento ocupado!" << endl;
                    }
                } else {
                    cout << "Erro: Posição inválida!" << endl;
                }
                break;
                
            case 2:
                cout << "\n===== MAPA DA SALA =====" << endl;
                cout << "  ";
                for (int c = 0; c < 5; c++) {
                    cout << "C" << c << " ";
                }
                cout << endl;
                
                for (int f = 0; f < 5; f++) {
                    cout << "F" << f << " ";
                    for (int c = 0; c < 5; c++) {
                        cout << "[" << sala[f][c] << "] ";
                    }
                    cout << endl;
                }
                cout << "\n[0] = Vazio  [1] = Ocupado" << endl;
                break;
                
            case 3:
                cout << "Encerrando o sistema..." << endl;
                break;
                
            default:
                cout << "Opção inválida! Tente novamente." << endl;
        }
        
    } while (opcao != 3);
    
    int ocupados = 0;
    int vazios = 0;
    
    for (int f = 0; f < 5; f++) {
        for (int c = 0; c < 5; c++) {
            if (sala[f][c] == 1) {
                ocupados++;
            } else {
                vazios++;
            }
        }
    }
    
    cout << "\n===== RELATÓRIO FINAL =====" << endl;
    cout << "Quantidade total de assentos ocupados: " << ocupados << endl;
    cout << "Quantidade total de assentos vazios: " << vazios << endl;
    cout << "===========================" << endl;
    
    return 0;
}
