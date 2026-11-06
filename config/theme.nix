{ pkgs, ... }:
{

  # colorscheme = "kanagawa";

  # colorschemes.gruvbox = {
  #   enable = true;
  #   package = pkgs.vimPlugins.gruvbox-community;
  # };
  #
  # colorschemes.tokyonight.enable = true;

  colorschemes.kanagawa = {
    enable = true;
    settings = {
      keywordStyle = {
        italic = false;
      };
      overrides = ''
        function(colors)
          return {
            CursorLine = {
              bg = colors.palette.sumiInk4,
            },
            ColorColumn = {
              bg = colors.palette.sumiInk2,
            },
            EndOfBuffer = {
              bg = colors.palette.sumiInk2,
            },
            DiagnosticUnnecessary = {
              undercurl = true,
              sp = colors.palette.fujiGray,
            },
            ExtraWhitespace = {
              bg = colors.theme.diag.error,
            },
            haskellConstraint = {
              fg = colors.palette.waveRed,
              italic = true,
            },
            haskellConstructor = {
              fg = colors.palette.waveAqua2,
            },
            haskellDeclaration = {
              fg = colors.palette.crystalBlue,
              bold = true,
            },
            haskellDefinition = {
              fg = colors.palette.crystalBlue,
            },
            haskellExpressionVariable = {
              fg = colors.palette.fujiWhite,
            },
            haskellImportAll = {
              fg = colors.palette.surimiOrange,
            },
            haskellKeyword = {
              fg = colors.palette.oniViolet,
            },
            haskellNamespace = {
              fg = colors.palette.boatYellow2,
            },
            haskellOperator = {
              fg = colors.palette.sakuraPink,
            },
            haskellPattern = {
              italic = true,
            },
            haskellPatternVariable = {
              fg = colors.palette.springViolet2,
              italic = true,
            },
            haskellPragma = {
              fg = colors.palette.surimiOrange,
            },
            haskellPunctuation = {
              fg = colors.palette.springViolet2,
            },
            haskellTypeVariable = {
              fg = sakura_types and colors.palette.peachRed or colors.palette.surimiOrange,
            },
            haskellType = {
              fg = sakura_types and colors.palette.sakuraPink or colors.palette.waveRed,
            },
            haskellWildcardPattern = {
              fg = colors.palette.fujiGray,
            },
            haskellCharacter = {
              link = "String",
            },
            haskellComment = {
              link = "Comment",
            },
            haskellField = {
              link = "Identifier",
            },
            haskellNamedWildcardPattern = {
              link = "haskellWildcardPattern",
            },
            haskellNumber = {
              link = "haskellConstructor",
            },
            haskellQuasiquote = {
              link = "haskellOperator",
            },
            haskellQuasiquoteBody = {
              link = "String",
            },
            haskellString = {
              link = "String",
            },
            haskellLambda = {
              link = "haskellPunctuation",
            },
            haskellBindStatement = {
              link = "haskellPunctuation",
            },
            haskellTypeApplication = {
              link = "haskellPunctuation",
            },
            ["@haskell.character"] = { link = "haskellCharacter" },
            ["@haskell.comment"] = { link = "haskellComment" },
            ["@haskell.constraint"] = { link = "haskellConstraint" },
            ["@haskell.constructor"] = { link = "haskellConstructor" },
            ["@haskell.declaration"] = { link = "haskellDeclaration" },
            ["@haskell.definition"] = { link = "haskellDefinition" },
            ["@haskell.expression.variable"] = { link = "haskellExpressionVariable" },
            ["@haskell.field"] = { link = "haskellField" },
            ["@haskell.import.all"] = { link = "haskellImportAll" },
            ["@haskell.keyword"] = { link = "haskellKeyword" },
            ["@haskell.namespace"] = { link = "haskellNamespace" },
            ["@haskell.number"] = { link = "haskellNumber" },
            ["@haskell.operator"] = { link = "haskellOperator" },
            ["@haskell.pattern"] = { link = "haskellPattern" },
            ["@haskell.pattern.variable"] = { link = "haskellPatternVariable" },
            ["@haskell.pattern.wildcard"] = { link = "haskellWildcardPattern" },
            ["@haskell.pattern.wildcard.named"] = { link = "haskellNamedWildcardPattern" },
            ["@haskell.pragma"] = { link = "haskellPragma" },
            ["@haskell.punctuation"] = { link = "haskellPunctuation" },
            ["@haskell.punctuation.lambda"] = { link = "haskellLambda" },
            ["@haskell.punctuation.bind"] = { link = "haskellBindStatement" },
            ["@haskell.punctuation.apply"] = { link = "haskellTypeApplication" },
            ["@haskell.quasiquote"] = { link = "haskellQuasiquote" },
            ["@haskell.quasiquote.body"] = { link = "haskellQuasiquoteBody" },
            ["@haskell.string"] = { link = "haskellString" },
            ["@haskell.type"] = { link = "haskellType" },
            ["@haskell.type.variable"] = { link = "haskellTypeVariable" },
          }
        end
      '';

    };
  };

}
