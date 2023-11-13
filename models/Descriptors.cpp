#include "Descriptors.h"


Descriptors::Descriptors()
{
}

Descriptors* Descriptors::instance()
{
    static Descriptors __instance;
    return &__instance;
}

NODE_DESCRIPTOR Descriptors::getDescriptor(const QString& name) const
{
    if (m_descs.find(name) == m_descs.end())
        return NODE_DESCRIPTOR();
    return m_descs[name];
}

void Descriptors::initDescs()
{
    NODE_DESCRIPTOR node = { "CreateCube", {{"position", "vec3f", PARAM_CTRL_VEC3}}, {{"prim", "prim", PARAM_CTRL_NONE}}};

    m_descs.insert("CreateCube", 
        { "CreateCube", 
        {
            {"position", "vec3f", PARAM_CTRL_VEC3},
            {"scaleSize", "vec3f", PARAM_CTRL_VEC3},
            {"rotate", "vec3f", PARAM_CTRL_VEC3},
            {"hasNormal", "bool", PARAM_CTRL_CHECKBOX},
            {"hasVertUV", "bool", PARAM_CTRL_CHECKBOX},
            {"isFlipFace", "bool", PARAM_CTRL_CHECKBOX},
            {"div_w", "int", PARAM_CTRL_LINEEDIT},
            {"div_h", "int", PARAM_CTRL_LINEEDIT},
            {"div_d", "int", PARAM_CTRL_LINEEDIT},
            {"size", "int", PARAM_CTRL_LINEEDIT},
            {"quads", "bool", PARAM_CTRL_CHECKBOX},
            {"SRC", "", PARAM_CTRL_NONE},
        },
        {{"prim", "prim", PARAM_CTRL_NONE},
         {"DST", "", PARAM_CTRL_NONE}}
    });

    m_descs.insert("ParticlesWrangle",
        { "ParticlesWrangle",
        {
            {"prim", "prim", PARAM_CTRL_NONE},
            {"zfxCode", "string", PARAM_CTRL_MULTITEXT},
            {"params", "dict", PARAM_CTRL_NONE},
            {"SRC", "", PARAM_CTRL_NONE}
        },
        {
            {"prim", "prim", PARAM_CTRL_NONE},
            {"DST", "", PARAM_CTRL_NONE}
        }
        }
    );

}