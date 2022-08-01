const generateClassDoc = doc => {
    const d =
        doc.heritageClauses.length === 0
            ? `
/**
 * ${doc.name}.
 */`
            : `
/**
 * ${doc.name}.
 *
 * @${doc.heritageClauses.map(h => `${h.type} {${h.value}}`).join('\n * @')}
 */`;

    return d.trim();
};

module.exports = {
    generateClassDoc,
    generateInterfaceDoc: generateClassDoc,
    generatePropertyDoc: doc => {
        return `
/**
 * ${doc.name}.
 */`.trimLeft();
    },
    generateFunctionDoc: doc => {
        const start =
            doc.params.length === 0
                ? `
/**
 * ${doc.name} - `
                : `
/**
 * ${doc.name} - 
 *
 * @param ${doc.params.map(p => `${p.name} - ${p.type}`).join('\n * @param ')}`;

        const delimiter =
            doc.params.length === 0 && doc.returnType !== ''
                ? `
 *`
                : ``;

        const end = doc.returnType
            ? `
 * @returns ${doc.returnType}
 */`
            : `
 */`;
        return `${start.trimLeft()}${delimiter}${end.trimRight()}`;
    },
};
