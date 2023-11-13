#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "selfdefinedqmltype.h"
#include <QQmlContext>
#include "mytest.h"
#include "quick_parameter.h"
#include "quick_node.h"
#include <QFontDatabase>
#include <QSurfaceFormat>


int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QSurfaceFormat format;
    format.setSamples(16);
    QSurfaceFormat::setDefaultFormat(format);

    QQmlApplicationEngine engine;

    QFontDatabase::addApplicationFont("qrc:/font/MiSans/MiSans-Thin.ttf");
    QFontDatabase::addApplicationFont("qrc:/font/MiSans/MiSans-Semibold.ttf");
    QFontDatabase::addApplicationFont("qrc:/font/MiSans/MiSans-Regular.ttf");
    QFontDatabase::addApplicationFont("qrc:/font/MiSans/MiSans-Normal.ttf");
    QFontDatabase::addApplicationFont("qrc:/font/MiSans/MiSans-Medium.ttf");
    QFontDatabase::addApplicationFont("qrc:/font/MiSans/MiSans-Light.ttf");
    QFontDatabase::addApplicationFont("qrc:/font/MiSans/MiSans-Heavy.ttf");
    QFontDatabase::addApplicationFont("qrc:/font/MiSans/MiSans-ExtraLight.ttf");
    QFontDatabase::addApplicationFont("qrc:/font/MiSans/MiSans-Demibold.ttf");
    QFontDatabase::addApplicationFont("qrc:/font/MiSans/MiSans-Bold.ttf");

    QFont font("MiSans", 10);
    app.setFont(font);


    //MyTest* test = new MyTest;
    //engine.rootContext()->setContextProperty("myTestQml", test);

    //qmlRegisterType<MyTest>("MyTestImportUri", 1, 0, "MyTestQmlName");
    qRegisterMetaType<ZQuickParam::CONTROL_TYPE>("ZQuickParam::CONTROL_TYPE");
    qmlRegisterType<ZQuickParam>("ZQuickParam", 1, 0, "ZQuickParam");
    qmlRegisterType<ZQuickNode>("ZQuickNode", 1, 0, "ZQuickNode");

    //QQmlComponent comp(&engine, QUrl(QStringLiteral("qrc:/qml/ZParam2.qml")));
    //QObject* myObject = comp.create();
    //ZQuickParam* item = qobject_cast<ZQuickParam*>(myObject);

    


    engine.load(QUrl(QStringLiteral("qrc:/qml/testNode.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}