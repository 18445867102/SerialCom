#include "serial.h"

Serial::Serial(QObject *parent) : QObject(parent)
{
    serialport = new QSerialPort(this);
    serialport->setPortName(QString("NULL"));           //设置初始串口号
    serialport->setBaudRate(QSerialPort::Baud9600);     //设置初始波特率
    serialport->setParity(QSerialPort::NoParity);       //设置没有校验位
    serialport->setDataBits(QSerialPort::Data8);        //设置数据位为8位
    serialport->setStopBits(QSerialPort::OneStop);      //设置停止位为1位

    connect(serialport, &QSerialPort::errorOccurred,
            [=](QSerialPort::SerialPortError error)mutable
            {
                if(error != QSerialPort::NoError)
                {
                    cout<<error;
                    emit signal_serialError();
                }
            });

    connect(serialport, &QSerialPort::readyRead,  //当收到字符时候,启动处理接收数据函数
            [=]()mutable
            {
                QByteArray data = serialport->readAll();
                emit signal_receiveData(data);
    });
}

Serial::~Serial()
{
    serialport->deleteLater();
}

void Serial::slot_openSerialPort( uint32_t openmode)
{
    if(serialport->isOpen() == false)
    {
        switch (openmode) {
        case 0:
            serialport->open(QIODevice::ReadOnly);
            break;
        case 1:
            serialport->open(QIODevice::WriteOnly);
            break;
        case 2:
            serialport->open(QIODevice::ReadWrite);
            break;
        default:
            break;
        }
    }

    emit signal_serialIsOpen(serialport->isOpen());
}

void Serial::slot_closeSerialPort()
{
    if(serialport->isOpen() == true)
    {
        serialport->close();
    }

    emit signal_serialIsOpen(serialport->isOpen());
}

void Serial::slot_setSerialPortName(QString name)
{
    serialport->setPortName(name);
}

void Serial::slot_sendData(const char* data, qint64 len)
{
    if(serialport->isOpen() == true)
    {
        serialport->write(data, len);
    }
}

void Serial::slot_setSerialPortBaudRate(quint32 baud)
{
    switch (baud) {
    case QSerialPort::Baud4800:
        serialport->setBaudRate(QSerialPort::Baud4800);
        break;
    case QSerialPort::Baud9600:
        serialport->setBaudRate(QSerialPort::Baud9600);
        break;
    case QSerialPort::Baud19200:
        serialport->setBaudRate(QSerialPort::Baud19200);
        break;
    case QSerialPort::Baud38400:
        serialport->setBaudRate(QSerialPort::Baud38400);
        break;
    case QSerialPort::Baud57600:
        serialport->setBaudRate(QSerialPort::Baud57600);
        break;
    case QSerialPort::Baud115200:
        serialport->setBaudRate(QSerialPort::Baud115200);
        break;
    default:
        break;
    }
}

void Serial::slot_setSerialPortParity(quint32 parity)
{
    switch (parity) {
    case 1:
        serialport->setParity(QSerialPort::NoParity);
        break;
    case 2:
        serialport->setParity(QSerialPort::EvenParity);
        break;
    case 3:
        serialport->setParity(QSerialPort::OddParity);
        break;
    case 4:
        serialport->setParity(QSerialPort::SpaceParity);
        break;
    case 5:
        serialport->setParity(QSerialPort::MarkParity);
        break;
    default:
        break;
    }
}

void Serial::slot_setSerialPortDateBits(quint32 bits)
{
    switch (bits) {
    case 0:
        serialport->setDataBits(QSerialPort::Data5);
        break;
    case 1:
        serialport->setDataBits(QSerialPort::Data6);
        break;
    case 2:
        serialport->setDataBits(QSerialPort::Data7);
        break;
    case 3:
        serialport->setDataBits(QSerialPort::Data8);
        break;
    default:
        break;
    }
}

void Serial::slot_setSerialPortStopBits(quint32 bits)
{
    switch (bits) {
    case 0:
        serialport->setStopBits(QSerialPort::OneStop);
        break;
    case 1:
        serialport->setStopBits(QSerialPort::OneAndHalfStop);
        break;
    case 2:
        serialport->setStopBits(QSerialPort::TwoStop);
        break;
    default:
        break;
    }
}
void Serial::slot_setSerialFlowControl(quint32 flowControl)
{
    switch (flowControl) {
    case 0:
        serialport->setFlowControl(QSerialPort::NoFlowControl);
        break;
    case 1:
        serialport->setFlowControl(QSerialPort::HardwareControl);
        break;
    case 2:
        serialport->setFlowControl(QSerialPort::SoftwareControl);
        break;
    default:
        break;
    }
}
