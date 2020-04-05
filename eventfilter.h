#ifndef EVENTFILTER_H
#define EVENTFILTER_H

#include <QAbstractNativeEventFilter>

#include <windows.h>
#include <dbt.h>

#include <QDebug>
#include <QObject>

class EventFilter:public QObject,public QAbstractNativeEventFilter
{
    Q_OBJECT
public:
    EventFilter();

private:
    bool nativeEventFilter(const QByteArray &eventType, void *message, long *result) override;

signals:
    void signalUpdateDevice();
};

#endif // EVENTFILTER_H
