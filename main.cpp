#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "selfdefinedqmltype.h"
#include <QQmlContext>
#include "mytest.h"
#include "quick_parameter.h"
#include "quick_node.h"
#include "models/NodesModel.h"
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

    qRegisterMetaType<ParamsModel*>("ParamsModel*");

    qmlRegisterUncreatableType<ParamControl>("zeno.enum", 1, 0, "ParamControl", "Not creatable as it is an enum type");

    //QQmlComponent comp(&engine, QUrl(QStringLiteral("qrc:/qml/ZParam2.qml")));
    //QObject* myObject = comp.create();
    //ZQuickParam* item = qobject_cast<ZQuickParam*>(myObject);

    NodesModel* nodesModel = new NodesModel("main");
    nodesModel->appendNode("17d801b-CreateCube", "CreateCube");

    QTimer timer;
    QObject::connect(&timer, &QTimer::timeout, [=]() {
        if (false) {
            QModelIndex idx = nodesModel->index(0, 0);
            //nodesModel->updateParamName(idx, 0, "pos2");
            //nodesModel->removeParam(idx, 0);

            ParamsModel* params = nodesModel->params(idx);
            //params->removeRow(1);

            //QStandardItem* pItem = new QStandardItem;
            //pItem->setData("fuckme", ROLE_OBJNAME);
            //pItem->setData("", ROLE_PARAM_TYPE);
            //pItem->setData(ParamControl::Multiline, ROLE_PARAM_CONTROL);
            //pItem->setData(true, ROLE_ISINPUT);
            //params->insertRow(3, pItem);

            params->setData(params->index(0, 0), ParamControl::Multiline, ROLE_PARAM_CONTROL);

            //nodesModel->setData(idx, "FUCKQML", ROLE_OBJNAME);
        }
    });
    timer.start(1000);

    nodesModel->appendNode("d8b3fc3d-ParticlesWrangle", "ParticlesWrangle");

    engine.rootContext()->setContextProperty("nodesModel", nodesModel);

    engine.load(QUrl(QStringLiteral("qrc:/qml/testGraphEditor.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}