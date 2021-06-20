import sys 
from PyQt5 import uic
from PyQt5.QtWidgets import QApplication , QMainWindow, QPushButton,QWidget , QMessageBox , QListWidget
import sqlite3
#Hola mi nombre es David o sino me puedes ubicar por mi Usuario MrRocklion
# el presente programa es un ejemplo de manejo de PYQT5 con la implementacion de bases de datos utilizando los 
#principales comandos CREATE , READ, UPDATE Y DELETE.
#Esta es la version 1 pero planeo ir mejorandola agregando mas funcionalidades de todas formas estoy abierto a cualquier retroalimentacion
#  agradeceria mucho si te subscribes a mi canal de YT donde tengo planeado 
#subir un curso practico de implementacion de HMI creadas en python con hardware como arduino , PIC o la nueva placa ESP32

#!SALUDOS MrRocklion <3!


miBase =  sqlite3.connect("usuarios.db")
miCursor =  miBase.cursor()
miCursor.execute("create table if not exists  USUARIOS (USUARIO VARCHAR(20) , PASSWORD VARCHAR(20))")
miBase.close()
def agregar_datos(usuario , password):
    miBase =  sqlite3.connect("usuarios.db")
    miCursor =  miBase.cursor()
    miCursor.execute("INSERT INTO USUARIOS VALUES('{}','{}')".format(usuario,password))
    miBase.commit()
    miBase.close()
def leer_datos():
    miBase =  sqlite3.connect("usuarios.db")
    miCursor =  miBase.cursor()
    miCursor.execute("create table if not exists  USUARIOS (USUARIO VARCHAR(20) , PASSWORD VARCHAR(20))")
    miCursor.execute("SELECT * FROM USUARIOS")
    all_users =  miCursor.fetchall()
    miBase.close()
    return all_users
def comprobacion(user,contra):
    data = leer_datos()
    key_list = []
    value_list = []
    for i  in  data:
        key_list.append(str(i[0]))
        value_list.append(str(i[1]))
    dict_from_list = dict(zip(key_list, value_list))
    print(dict_from_list)
    if user in key_list:
        if dict_from_list.get(user) == contra:
            return True
    return False
def borrar_dato(usuario):
    miBase =  sqlite3.connect("usuarios.db")
    miCursor =  miBase.cursor()
    miCursor.execute("DELETE FROM USUARIOS WHERE USUARIO = '{}'".format(usuario))
    miBase.commit()
    miBase.close()
def actualizar(nueva_pass,user): 
    miBase =  sqlite3.connect("usuarios.db")
    miCursor =  miBase.cursor()
    miCursor.execute("UPDATE USUARIOS SET PASSWORD = '{}' WHERE USUARIO = '{}'".format(nueva_pass,user))
    miBase.commit()
    miBase.close()


class menu(QMainWindow):
    def __init__(self):
        super().__init__()
        uic.loadUi("inicio.ui",self)
        self.crear.clicked.connect(self.boton_crear)
        self.eliminar.clicked.connect(self.boton_eliminar)
        self.cambiar.clicked.connect(self.boton_cambiar)
        self.revisar.clicked.connect(self.boton_revisar)
        self.salir.clicked.connect(self.boton_salir)
        
    
    def boton_crear(self):
                self.hide()
                self.s = crear()
                self.s.show()
    def boton_eliminar(self):
                self.hide()
                self.s = eliminar()
                self.s.show()
    def boton_cambiar(self):
                self.hide()
                self.s = cambiar()
                self.s.show()
    def boton_revisar(self):
                self.hide()
                self.s = revisar()
                self.s.show()
    def boton_salir(self):
                self.close()

class crear(QWidget):
    def __init__(self):
        super().__init__()
        uic.loadUi("crear.ui",self)
        self.volver.clicked.connect(self.slot_btn_function)#
        self.crear.clicked.connect(self.registrarse) 
    def slot_btn_function(self):
                self.hide()
                self.f = menu()
                self.f.show()
    def registrarse(self):
        user = str(self.txt.toPlainText())
        pass1 = str(self.txt1.toPlainText())
        pass2 = str(self.txt2.toPlainText())
        if pass1 == pass2 and pass1 !="" and user != "":
            agregar_datos(user,pass1)
            QMessageBox.information(self,"Informacion","cuenta creada con exito!")
            
        else:
            QMessageBox.warning(self, "eror1","ingresaste mal el usuario o contraseña")

class eliminar(QWidget):
    def __init__(self):
        super().__init__()
        uic.loadUi("eliminar.ui",self)
        self.volver.clicked.connect(self.slot_btn_function)
        self.eliminar.clicked.connect(self.borrar_cuenta)
    def borrar_cuenta(self):
        user = str(self.txt.toPlainText())
        contra = str(self.txt1.toPlainText())
        cond = comprobacion(user,contra)
        if cond== True:
            borrar_dato(user)
            QMessageBox.information(self,"Informacion","usuario eliminado con exito!")
        else: 
            QMessageBox.warning(self, "eror1","ingresaste mal el usuario o contraseña")


    def slot_btn_function(self):
                self.hide()
                self.f = menu()
                self.f.show()
class cambiar(QWidget):
    def __init__(self):
        super().__init__()
        uic.loadUi("cpassword.ui",self)
        self.volver.clicked.connect(self.slot_btn_function)
        self.iniciar.clicked.connect(self.iniciar_sesion)

    def slot_btn_function(self):
                self.hide()
                self.f = menu()
                self.f.show()
    def iniciar_sesion(self):
        global actual_user 
        actual_user = str(self.txt.toPlainText())
        contra = str(self.txt1.toPlainText())
        cond = comprobacion(actual_user,contra)
        if cond == True:
            self.hide()
            self.f = cambio_pass()
            self.f.show()
        else: 
            QMessageBox.warning(self, "eror1","ingresaste mal el usuario o contraseña")
class revisar(QWidget):
    def __init__(self):
        data = leer_datos()
        super().__init__()
        uic.loadUi("revisar.ui",self)
        self.volver.clicked.connect(self.slot_btn_function)
        num = 0
        for i  in  data:
            num += 1
            self.listWidget.addItem(str(i[0]+"|"+i[1]))
        self.nro.setText(str(num))
    def slot_btn_function(self):
                self.hide()
                self.f = menu()
                self.f.show()
class cambio_pass(QWidget):
    def __init__(self):
        super().__init__()
        uic.loadUi("cambiar.ui",self)
        self.volver.clicked.connect(self.slot_btn_function)#
        self.crear.clicked.connect(self.cambiar_pass)#
    def slot_btn_function(self):
        self.hide()
        self.f = menu()
        self.f.show()
    def cambiar_pass(self):
        new_contra = str(self.txt1.toPlainText())
        new_contra_2 = str(self.txt2.toPlainText())
        print(actual_user)
        if new_contra == new_contra_2:
            actualizar(new_contra, actual_user)
            QMessageBox.information(self,"Informacion","cambio de contraseña con exito!")
            self.hide()
            self.f = menu()
            self.f.show() 
        else:
            QMessageBox.warning(self, "eror2","las contraseñas no coinciden")          
if __name__ == "__main__":
    app =  QApplication(sys.argv)
    GUI = menu()
    GUI.show()
    sys.exit(app.exec_())