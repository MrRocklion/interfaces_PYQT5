import sys 
from PyQt5 import uic
from PyQt5.QtWidgets import QApplication , QMainWindow

Form, Window = uic.loadUiType("app1.ui")
class sumador_restador(QMainWindow):
    def __init__(self):
        super().__init__()
        uic.loadUi("app1.ui",self)
        self.sumar.clicked.connect(self.suma)
        self.restar.clicked.connect(self.resta)
        
    def suma(self):
        try:
            x = int(self.txt1.toPlainText())
            y = int(self.txt2.toPlainText())
            valor = x+y
        except ValueError:
            valor = "dato erroneo"
        self.result.setText(str(valor))
    def resta(self):
        try:
            x = int(self.txt1.toPlainText())
            y = int(self.txt2.toPlainText())
            valor = x-y
        except ValueError:
            valor = "dato erroneo"
        self.result.setText(str(valor))
if __name__ == "__main__":
    app =  QApplication(sys.argv)
    GUI = sumador_restador()
    GUI.show()
    sys.exit(app.exec_())