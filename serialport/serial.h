#ifndef SERIAL_H
#define SERIAL_H

#include <QObject>
#include <QtSerialPort/QSerialPort>
#include <QtSerialPort/QSerialPortInfo>
#include <QTextCodec>

#include <QDebug>
#define cout  qDebug() << __LINE__ << ":"

class Serial : public QObject
{
    Q_OBJECT
public:
    explicit Serial(QObject *parent = nullptr);
    ~Serial();

    QSerialPort *serialport;
signals:
    void signal_receiveData(QString recv);        //更新显示信号
    void signal_serialIsOpen(bool isOpen);             //串口是否打开信号
    void signal_serialError();

public slots:
    void slot_openSerialPort(uint32_t openmode);   //打开串口

    void slot_setSerialPortName(QString);
    void slot_setSerialPortBaudRate(quint32);    //设置serialport端口波特率信号
    void slot_setSerialPortParity(quint32);      //设置serialport端口校验位
    void slot_setSerialPortDateBits(quint32);    //设置serialport端口数据位
    void slot_setSerialPortStopBits(quint32);    //设置serialport端口停止位
    void slot_setSerialFlowControl(quint32 flowControl);
    void slot_sendData(const char *, qint64);         //发送数据
private:
    bool hexIn;
    bool hexOut;
protected:

//friend class XXX;
};

#endif // SERIAL_H
