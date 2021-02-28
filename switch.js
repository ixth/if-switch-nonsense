function fn(pattern, template) {
    switch (true) {
        // if toType already exists
        case !!pattern.toType:
            break;
        case template.test(pattern.to):
            pattern.toType = "template";
            break;
        case isToDirectory:
            pattern.toType = "dir";
            break;
        default:
            pattern.toType = "file";
    }
}

fn({}, /(?:)/);
