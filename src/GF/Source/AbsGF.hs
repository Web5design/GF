module AbsGF where

import Ident --H

-- Haskell module generated by the BNF converter, except for --H

-- newtype Ident = Ident String deriving (Eq,Ord,Show) --H

newtype LString = LString String deriving (Eq,Ord,Show)

data Grammar =
   Gr [ModDef]
  deriving (Eq,Ord,Show)

data ModDef =
   MMain Ident Ident [ConcSpec]
 | MAbstract Ident Extend Opens [TopDef]
 | MResource Ident Extend Opens [TopDef]
 | MResourceInt Ident Extend Opens [TopDef]
 | MResourceImp Ident Ident Opens [TopDef]
 | MConcrete Ident Ident Extend Opens [TopDef]
 | MConcreteInt Ident Ident Extend Opens [TopDef]
 | MConcreteImp Open Ident Ident
 | MTransfer Ident Open Open Extend Opens [TopDef]
 | MReuseAbs Ident Ident
 | MReuseCnc Ident Ident
 | MReuseAll Ident Extend Ident
  deriving (Eq,Ord,Show)

data ConcSpec =
   ConcSpec Ident ConcExp
  deriving (Eq,Ord,Show)

data ConcExp =
   ConcExp Ident [Transfer]
  deriving (Eq,Ord,Show)

data Transfer =
   TransferIn Open
 | TransferOut Open
  deriving (Eq,Ord,Show)

data Extend =
   Ext Ident
 | NoExt
  deriving (Eq,Ord,Show)

data Opens =
   NoOpens
 | Opens [Open]
  deriving (Eq,Ord,Show)

data Open =
   OName Ident
 | OQual Ident Ident
  deriving (Eq,Ord,Show)

data Def =
   DDecl [Ident] Exp
 | DDef [Ident] Exp
 | DPatt Ident [Patt] Exp
 | DFull [Ident] Exp Exp
  deriving (Eq,Ord,Show)

data TopDef =
   DefCat [CatDef]
 | DefFun [FunDef]
 | DefDef [Def]
 | DefData [ParDef]
 | DefTrans [FlagDef]
 | DefPar [ParDef]
 | DefOper [Def]
 | DefLincat [PrintDef]
 | DefLindef [Def]
 | DefLin [Def]
 | DefPrintCat [PrintDef]
 | DefPrintFun [PrintDef]
 | DefFlag [FlagDef]
 | DefPrintOld [PrintDef]
 | DefLintype [Def]
 | DefPattern [Def]
  deriving (Eq,Ord,Show)

data CatDef =
   CatDef Ident [DDecl]
  deriving (Eq,Ord,Show)

data FunDef =
   FunDef [Ident] Exp
  deriving (Eq,Ord,Show)

data ParDef =
   ParDef Ident [ParConstr]
 | ParDefIndir Ident Ident
 | ParDefAbs Ident
  deriving (Eq,Ord,Show)

data ParConstr =
   ParConstr Ident [DDecl]
  deriving (Eq,Ord,Show)

data PrintDef =
   PrintDef [Ident] Exp
  deriving (Eq,Ord,Show)

data FlagDef =
   FlagDef Ident Ident
  deriving (Eq,Ord,Show)

data LocDef =
   LDDecl [Ident] Exp
 | LDDef [Ident] Exp
 | LDFull [Ident] Exp Exp
  deriving (Eq,Ord,Show)

data Exp =
   EIdent Ident
 | EConstr Ident
 | ECons Ident
 | ESort Sort
 | EString String
 | EInt Integer
 | EMeta
 | EEmpty
 | EStrings String
 | ERecord [LocDef]
 | ETuple [TupleComp]
 | EIndir Ident
 | ETyped Exp Exp
 | EProj Exp Label
 | EQConstr Ident Ident
 | EQCons Ident Ident
 | EApp Exp Exp
 | ETable [Case]
 | ETTable Exp [Case]
 | ECase Exp [Case]
 | EVariants [Exp]
 | EPre Exp [Altern]
 | EStrs [Exp]
 | EConAt Ident Exp
 | ESelect Exp Exp
 | ETupTyp Exp Exp
 | EExtend Exp Exp
 | EAbstr [Bind] Exp
 | ECTable [Bind] Exp
 | EProd Decl Exp
 | ETType Exp Exp
 | EConcat Exp Exp
 | EGlue Exp Exp
 | ELet [LocDef] Exp
 | EEqs [Equation]
 | ELString LString
 | ELin Ident
  deriving (Eq,Ord,Show)

data Patt =
   PW
 | PV Ident
 | PCon Ident
 | PQ Ident Ident
 | PInt Integer
 | PStr String
 | PR [PattAss]
 | PTup [PattTupleComp]
 | PC Ident [Patt]
 | PQC Ident Ident [Patt]
  deriving (Eq,Ord,Show)

data PattAss =
   PA [Ident] Patt
  deriving (Eq,Ord,Show)

data Label =
   LIdent Ident
 | LVar Integer
  deriving (Eq,Ord,Show)

data Sort =
   Sort_Type
 | Sort_PType
 | Sort_Tok
 | Sort_Str
 | Sort_Strs
  deriving (Eq,Ord,Show)

data PattAlt =
   AltP Patt
  deriving (Eq,Ord,Show)

data Bind =
   BIdent Ident
 | BWild
  deriving (Eq,Ord,Show)

data Decl =
   DDec [Bind] Exp
 | DExp Exp
  deriving (Eq,Ord,Show)

data TupleComp =
   TComp Exp
  deriving (Eq,Ord,Show)

data PattTupleComp =
   PTComp Patt
  deriving (Eq,Ord,Show)

data Case =
   Case [PattAlt] Exp
  deriving (Eq,Ord,Show)

data Equation =
   Equ [Patt] Exp
  deriving (Eq,Ord,Show)

data Altern =
   Alt Exp Exp
  deriving (Eq,Ord,Show)

data DDecl =
   DDDec [Bind] Exp
 | DDExp Exp
  deriving (Eq,Ord,Show)

data OldGrammar =
   OldGr Include [TopDef]
  deriving (Eq,Ord,Show)

data Include =
   NoIncl
 | Incl [FileName]
  deriving (Eq,Ord,Show)

data FileName =
   FString String
 | FIdent Ident
 | FSlash FileName
 | FDot FileName
 | FMinus FileName
 | FAddId Ident FileName
  deriving (Eq,Ord,Show)

