#include "serialinterface.h"

SerialInterface::SerialInterface(QObject *parent) : QObject(parent)
{
    serial = new Serial();
    thread = new QThread(this);

    serial->moveToThread(thread);
    thread->start();

    connect(serial, SIGNAL(signal_receiveData(QString)), this, SLOT(receive_data(QString)));
    connect(serial, SIGNAL(signal_serialIsOpen(bool)), this, SIGNAL(signalIsopen(bool)));
    connect(this,&SerialInterface::signalOpenSerialPort, serial, &Serial::slot_openSerialPort);
    connect(this,&SerialInterface::signalSendData, serial, &Serial::slot_sendData);
}

void SerialInterface::openSerialPort(quint32 openmode)
{
    emit signalOpenSerialPort(openmode);
}

void SerialInterface::receive_data(QString data)
{
    emit signalReceive(data);
}

void SerialInterface::setSerialPortName(QString name)
{
    serial->slot_setSerialPortName(name);
}

void SerialInterface::setSerialPortBaudRate(quint32 baudrate)
{
    serial->slot_setSerialPortBaudRate(baudrate);
}

void SerialInterface::setSerialPortParity(quint32 parity)
{
    serial->slot_setSerialPortParity(parity);
}

void SerialInterface::setSerialPortDateBits(quint32 datebits)
{
    serial->slot_setSerialPortDateBits(datebits);
}

void SerialInterface::setSerialPortStopBits(quint32 stopbits)
{
    serial->slot_setSerialPortStopBits(stopbits);
}

void SerialInterface::setSerialFlowControl(quint32 flowControl)
{
    serial->slot_setSerialFlowControl(flowControl);
}

void SerialInterface::slot_sendData(QString data, qint64 len)
{
    emit signalSendData(data, len);
}
void SerialInterface::upAvailablePorts()
{
    QList<QSerialPortInfo> listinfo = QSerialPortInfo::availablePorts();

    emit signalClearComx();

    if(listinfo.isEmpty() == false)
    {
        foreach(QSerialPortInfo info, listinfo)
        {
            emit signalAddComx(info.portName(), info.description());
        }
    }
}
SerialInterface::~SerialInterface()
{
    serial->deleteLater();
    thread->quit();
    thread->wait();
    thread->deleteLater();
}
