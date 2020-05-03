#ifndef SERIALINTERFACE_H
#define SERIALINTERFACE_H

#include <QObject>
#include <QThread>

#include <serialport/serial.h>

class SerialInterface : public QObject
{
    Q_OBJECT
public:
    SerialInterface(QObject *parent = nullptr);
    ~SerialInterface();

private:
    Serial *serial;
    QThread *thread;

signals:
    void signalReceive(QString data);
    void signalOpenSerialPort(quint32 mode);
    void signalIsopen(bool isOpen);
    void signalClearComx();             //清空串口号列表
    void signalAddComx(QString comName, QString desc);//添加串口名和描述
    void signalSendData(QString, qint64);

public slots:
    void upAvailablePorts();
    void openSerialPort(quint32);          //打开串口
    void receive_data(QString);
    void setSerialPortName(QString);
    void setSerialPortBaudRate(quint32);    //设置serialport端口波特率信号
    void setSerialPortParity(quint32);      //设置serialport端口校验位
    void setSerialPortDateBits(quint32);    //设置serialport端口数据位
    void setSerialPortStopBits(quint32);    //设置serialport端口停止位
    void setSerialFlowControl(quint32 flowControl);
    void slot_sendData(QString, qint64);         //发送数据
};

#endif // SERIALINTERFACE_H
