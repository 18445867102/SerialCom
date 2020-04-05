#include "eventfilter.h"
#define cout  qDebug() << __LINE__ << ":"
EventFilter::EventFilter()
{

}

bool EventFilter::nativeEventFilter(const QByteArray &eventType, void *message, long *result)
{
    Q_UNUSED(result)
    if (eventType == "windows_generic_MSG")
    {
        bool bResult = false;
        MSG* msg = reinterpret_cast<MSG*>(message);

        //PDEV_BROADCAST_HDR lpdb = (PDEV_BROADCAST_HDR)msg->lParam;
        if(msg->message == WM_DEVICECHANGE && msg->wParam >= DBT_DEVICEARRIVAL)
        {
            switch (msg->wParam)
            {
            case DBT_DEVICEARRIVAL:
            case DBT_DEVICEREMOVECOMPLETE:
                emit signalUpdateDevice();
                bResult = true;
                break;
            case DBT_DEVNODES_CHANGED:
                bResult = true;
                break;
            default:
                bResult = false;
                break;
            }
        }
        return bResult;
    } else {
        return false;
    }
}
