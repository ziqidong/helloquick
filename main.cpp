#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "selfdefinedqmltype.h"
#include <QQmlContext>
#include "mytest.h"
#include "quick_parameter.h"
#include "quick_node.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;


    //MyTest* test = new MyTest;
    //engine.rootContext()->setContextProperty("myTestQml", test);

    //qmlRegisterType<MyTest>("MyTestImportUri", 1, 0, "MyTestQmlName");
    qRegisterMetaType<ZQuickParam::CONTROL_TYPE>("ZQuickParam::CONTROL_TYPE");
    qmlRegisterType<ZQuickParam>("ZQuickParam", 1, 0, "ZQuickParam");
    qmlRegisterType<ZQuickNode>("ZQuickNode", 1, 0, "ZQuickNode");

    engine.load(QUrl(QStringLiteral("qrc:/qml/testNode.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}