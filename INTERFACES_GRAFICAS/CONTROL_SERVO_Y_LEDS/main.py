# This Python file uses the following encoding: utf-8
import sys
import os
import serial
from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtCore import QObject ,Slot,Signal
from serial.serialutil import PARITY_EVEN, PARITY_NONE, SerialException
# Hola soy MrRocklion !
# SI PUEDEN Y QUIEREN APOYAR A LA JUVENTUD SUSCRIBANSE A MI CANAL :D 
# https://youtu.be/gMF78KGrsW0 

estado = False
def serialInit(port,baud,parit):
    global comunication
    if parit == True:
        comunication = serial.Serial(port = port ,baudrate = baud,parity = PARITY_EVEN )
    else:
        comunication = serial.Serial(port = port ,baudrate = baud,parity = PARITY_NONE )
    

class MainWindow(QObject):
    def __init__(self):
        QObject.__init__(self)
    #signals
    setState = Signal(bool)
    setError = Signal(str)
    setDefect = Signal(bool)

    #functions of page 1
    @Slot(str,str,bool)
    def serialConnect(self,port,baudRate,parity):
        global estado
        print("el puerto es: "+port)
        print("la velocidad es: "+baudRate)
        print("quiere paridad: " + str(parity))
        velocity = int(baudRate)
        par = bool(parity)
        try:
            serialInit(port,velocity,par)
            self.setState.emit(True)
            estado = True
        except SerialException:
            self.setError.emit("COM NO DISPONIBLE")
    @Slot()
    def serialDisconnect(self):
        global estado
        comunication.close()
        self.setState.emit(False)
        estado = False
    @Slot()
    def leftButtons(self):
        global estado
        self.setDefect.emit(estado)
    #Functions on page hmi
    @Slot(bool)
    def led1(self,state):
        if state == True:
            enviar = 'LED1,ON'
            comunication.write(enviar.encode('ascii'))
        else:
            enviar = 'LED1,OFF'
            comunication.write(enviar.encode('ascii'))
            
    @Slot(bool)
    def led2(self,state):
        if state == True:
            enviar = 'LED2,ON'
            comunication.write(enviar.encode('ascii'))
        else:
            enviar = 'LED2,OFF'
            comunication.write(enviar.encode('ascii'))
    @Slot(bool)
    def led3(self,state):
        if state == True:
            enviar = 'LED3,ON'
            comunication.write(enviar.encode('ascii'))
        else:
            enviar = 'LED3,OFF'
            comunication.write(enviar.encode('ascii'))
    @Slot(bool)
    def led4(self,state):
        if state == True:
            enviar = 'LED4,ON'
            comunication.write(enviar.encode('ascii'))
        else:
            enviar = 'LED4,OFF'
            comunication.write(enviar.encode('ascii'))
    @Slot(bool)
    def led5(self,state):
        if state == True:
            enviar = 'LED5,ON'
            comunication.write(enviar.encode('ascii'))
        else:
            enviar = 'LED5,OFF'
            comunication.write(enviar.encode('ascii'))
    @Slot(int)
    def servo1(self,value):
        if value <10:
            enviar = "SERVO1,"+str(value+10)
            print(enviar)
            comunication.write(enviar.encode('ascii'))
        else:
            enviar = "SERVO1,"+str(value)
            print(enviar)
            comunication.write(enviar.encode('ascii'))

if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()
    main = MainWindow()
    engine.rootContext().setContextProperty("backend",main)
    engine.load(os.path.join(os.path.dirname(__file__), "qml/main.qml"))

    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())
