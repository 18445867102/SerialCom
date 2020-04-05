#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QPropertyAnimation>
#include <QQmlContext>
#include <QThread>

#include "serialport/serialinterface.h"
#include "eventfilter.h"

#include <QDebug>
#define cout  qDebug() << __LINE__ << ":"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    SerialInterface *serialInterface = new SerialInterface();
    EventFilter *filter = new EventFilter;

    QObject::connect(filter,SIGNAL(signalUpdateDevice()), serialInterface, SLOT(upAvailablePorts()));
    //安装本地事件过滤器，相应逻辑在过滤器中处理
    app.installNativeEventFilter(filter);

    QQmlApplicationEngine engine;

    engine.rootContext()->setContextProperty("SerialInterFace", serialInterface);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    QObject::connect(&app, &QGuiApplication::aboutToQuit,
                     [=](){

    });
    return app.exec();
}
