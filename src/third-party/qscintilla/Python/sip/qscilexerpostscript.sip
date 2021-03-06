// This is the SIP interface definition for QsciLexerPostScript.
//
// Copyright (c) 2012 Riverbank Computing Limited <info@riverbankcomputing.com>
// 
// This file is part of QScintilla.
// 
// This file may be used under the terms of the GNU General Public
// License versions 2.0 or 3.0 as published by the Free Software
// Foundation and appearing in the files LICENSE.GPL2 and LICENSE.GPL3
// included in the packaging of this file.  Alternatively you may (at
// your option) use any later version of the GNU General Public
// License if such license has been publicly approved by Riverbank
// Computing Limited (or its successors, if any) and the KDE Free Qt
// Foundation. In addition, as a special exception, Riverbank gives you
// certain additional rights. These rights are described in the Riverbank
// GPL Exception version 1.1, which can be found in the file
// GPL_EXCEPTION.txt in this package.
// 
// If you are unsure which license is appropriate for your use, please
// contact the sales department at sales@riverbankcomputing.com.
// 
// This file is provided AS IS with NO WARRANTY OF ANY KIND, INCLUDING THE
// WARRANTY OF DESIGN, MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.


class QsciLexerPostScript : QsciLexer
{
%TypeHeaderCode
#include <Qsci/qscilexerpostscript.h>
%End

public:
    enum {
        Default,
        Comment,
        DSCComment,
        DSCCommentValue,
        Number,
        Name,
        Keyword,
        Literal,
        ImmediateEvalLiteral,
        ArrayParenthesis,
        DictionaryParenthesis,
        ProcedureParenthesis,
        Text,
        HexString,
        Base85String,
        BadStringCharacter
    };

%If (Qsci_Qt4)
    QsciLexerPostScript(QObject *parent /TransferThis/ = 0);
%End
%If (!Qsci_Qt4)
    QsciLexerPostScript(QObject *parent /TransferThis/ = 0, const char *name = 0);
%End

    virtual ~QsciLexerPostScript();

    const char *language() const;
    const char *lexer() const;
    QColor defaultColor(int style) const;
    QFont defaultFont(int style) const;
    QColor defaultPaper(int style) const;
    const char *keywords(int set) const;
    QString description(int style) const;

    void refreshProperties();
    bool tokenize() const;
    int level() const;
    bool foldCompact() const;
    bool foldAtElse() const;

public slots:
    virtual void setTokenize(bool tokenize);
    virtual void setLevel(int level);
    virtual void setFoldCompact(bool fold);
    virtual void setFoldAtElse(bool fold);

protected:
    bool readProperties(QSettings &qs, const QString &prefix);
    bool writeProperties(QSettings &qs, const QString &prefix) const;

private:
    QsciLexerPostScript(const QsciLexerPostScript &);
};
