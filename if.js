function fn(pattern, template) {
    // if toType already exists do nothing
    if (!pattern.toType) {
        if (template.test(pattern.to)) {
            pattern.toType = "template";
        } else if (isToDirectory) {
            pattern.toType = "dir";
        } else {
            pattern.toType = "file";
        }
    }
}

fn({}, /(?:)/);
