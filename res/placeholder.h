#ifndef PLACEHOLDER_H_
#define PLACEHOLDER_H_

// glext requires that some previous header sets various GL related
// macros/types. We can't call the Ada binding generator directly on this header
// as it fails with missing declarations. This placeholder includes both files
// and can be used with the binding generator instead.
#include <GL/gl.h>
#include <GL/glext.h>

#endif // PLACEHOLDER_H_
