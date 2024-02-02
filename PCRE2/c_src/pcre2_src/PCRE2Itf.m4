/**
 * <interfacename>PCRE2</interfacename>
 * <description></description>
 *
 * <copyright></copyright>
 */

SET_INTERFACE_NAME(`PCRE2')
SET_PLACEHOLDER_NAME(`PCRE2')

/** EXTERN LIB SECTION BEGIN **/
/*  Comments are ignored for m4 compiler so restructured text can be used. changecom(`/*', `*/') */

#ifdef __cplusplus
extern "C" {
#endif

/**
 * <description>
 * PCRE2 compile options.
 * These can be combined using bitwise OR operations.
 * See also: https://pcre2project.github.io/pcre2/doc/html/pcre2_compile.html
 * </description>
 * <element name="ECOMPILEOPTIONS_PCRE2_ALLOW_EMPTY_CLASS" type=OUT></element>
 * <element name="ECOMPILEOPTIONS_PCRE2_ALT_BSUX" type=OUT></element>
 * <element name="ECOMPILEOPTIONS_PCRE2_ALT_CIRCUMFLEX" type=OUT></element>
 * <element name="ECOMPILEOPTIONS_PCRE2_ALT_VERBNAMES" type=OUT></element>
 * <element name="ECOMPILEOPTIONS_PCRE2_ANCHORED" type=OUT></element>
 * <element name="ECOMPILEOPTIONS_PCRE2_AUTO_CALLOUT" type=OUT></element>
 * <element name="ECOMPILEOPTIONS_PCRE2_CASELESS" type=OUT></element>
 * <element name="ECOMPILEOPTIONS_PCRE2_DOLLAR_ENDONLY" type=OUT></element>
 * <element name="ECOMPILEOPTIONS_PCRE2_DOTALL" type=OUT></element>
 * <element name="ECOMPILEOPTIONS_PCRE2_DUPNAMES" type=OUT></element>
 * <element name="ECOMPILEOPTIONS_PCRE2_ENDANCHORED" type=OUT></element>
 * <element name="ECOMPILEOPTIONS_PCRE2_EXTENDED" type=OUT></element>
 * <element name="ECOMPILEOPTIONS_PCRE2_EXTENDED_MORE" type=OUT></element>
 * <element name="ECOMPILEOPTIONS_PCRE2_FIRSTLINE" type=OUT></element>
 * <element name="ECOMPILEOPTIONS_PCRE2_LITERAL" type=OUT></element>
 * <element name="ECOMPILEOPTIONS_PCRE2_MATCH_INVALID_UTF" type=OUT></element>
 * <element name="ECOMPILEOPTIONS_PCRE2_MATCH_UNSET_BACKREF" type=OUT></element>
 * <element name="ECOMPILEOPTIONS_PCRE2_MULTILINE" type=OUT></element>
 * <element name="ECOMPILEOPTIONS_PCRE2_NEVER_BACKSLASH_C" type=OUT></element>
 * <element name="ECOMPILEOPTIONS_PCRE2_NEVER_UCP" type=OUT></element>
 * <element name="ECOMPILEOPTIONS_PCRE2_NEVER_UTF" type=OUT></element>
 * <element name="ECOMPILEOPTIONS_PCRE2_NO_AUTO_CAPTURE" type=OUT></element>
 * <element name="ECOMPILEOPTIONS_PCRE2_NO_AUTO_POSSESS" type=OUT></element>
 * <element name="ECOMPILEOPTIONS_PCRE2_NO_DOTSTAR_ANCHOR" type=OUT></element>
 * <element name="ECOMPILEOPTIONS_PCRE2_NO_START_OPTIMIZE" type=OUT></element>
 * <element name="ECOMPILEOPTIONS_PCRE2_NO_UTF_CHECK" type=OUT></element>
 * <element name="ECOMPILEOPTIONS_PCRE2_UCP" type=OUT></element>
 * <element name="ECOMPILEOPTIONS_PCRE2_UNGREEDY" type=OUT></element>
 * <element name="ECOMPILEOPTIONS_PCRE2_USE_OFFSET_LIMIT" type=OUT></element>
 * <element name="ECOMPILEOPTIONS_PCRE2_UTF" type=OUT></element>
*/
#define ECOMPILEOPTIONS_PCRE2_ALLOW_EMPTY_CLASS    RTS_IEC_UDINT_C(0x1)
#define ECOMPILEOPTIONS_PCRE2_ALT_BSUX    RTS_IEC_UDINT_C(0x2)
#define ECOMPILEOPTIONS_PCRE2_ALT_CIRCUMFLEX    RTS_IEC_UDINT_C(0x200000)
#define ECOMPILEOPTIONS_PCRE2_ALT_VERBNAMES    RTS_IEC_UDINT_C(0x400000)
#define ECOMPILEOPTIONS_PCRE2_ANCHORED    RTS_IEC_UDINT_C(0x80000000)
#define ECOMPILEOPTIONS_PCRE2_AUTO_CALLOUT    RTS_IEC_UDINT_C(0x4)
#define ECOMPILEOPTIONS_PCRE2_CASELESS    RTS_IEC_UDINT_C(0x8)
#define ECOMPILEOPTIONS_PCRE2_DOLLAR_ENDONLY    RTS_IEC_UDINT_C(0x10)
#define ECOMPILEOPTIONS_PCRE2_DOTALL    RTS_IEC_UDINT_C(0x20)
#define ECOMPILEOPTIONS_PCRE2_DUPNAMES    RTS_IEC_UDINT_C(0x40)
#define ECOMPILEOPTIONS_PCRE2_ENDANCHORED    RTS_IEC_UDINT_C(0x20000000)
#define ECOMPILEOPTIONS_PCRE2_EXTENDED    RTS_IEC_UDINT_C(0x80)
#define ECOMPILEOPTIONS_PCRE2_EXTENDED_MORE    RTS_IEC_UDINT_C(0x1000000)
#define ECOMPILEOPTIONS_PCRE2_FIRSTLINE    RTS_IEC_UDINT_C(0x100)
#define ECOMPILEOPTIONS_PCRE2_LITERAL    RTS_IEC_UDINT_C(0x2000000)
#define ECOMPILEOPTIONS_PCRE2_MATCH_INVALID_UTF    RTS_IEC_UDINT_C(0x4000000)
#define ECOMPILEOPTIONS_PCRE2_MATCH_UNSET_BACKREF    RTS_IEC_UDINT_C(0x200)
#define ECOMPILEOPTIONS_PCRE2_MULTILINE    RTS_IEC_UDINT_C(0x400)
#define ECOMPILEOPTIONS_PCRE2_NEVER_BACKSLASH_C    RTS_IEC_UDINT_C(0x100000)
#define ECOMPILEOPTIONS_PCRE2_NEVER_UCP    RTS_IEC_UDINT_C(0x800)
#define ECOMPILEOPTIONS_PCRE2_NEVER_UTF    RTS_IEC_UDINT_C(0x1000)
#define ECOMPILEOPTIONS_PCRE2_NO_AUTO_CAPTURE    RTS_IEC_UDINT_C(0x2000)
#define ECOMPILEOPTIONS_PCRE2_NO_AUTO_POSSESS    RTS_IEC_UDINT_C(0x4000)
#define ECOMPILEOPTIONS_PCRE2_NO_DOTSTAR_ANCHOR    RTS_IEC_UDINT_C(0x8000)
#define ECOMPILEOPTIONS_PCRE2_NO_START_OPTIMIZE    RTS_IEC_UDINT_C(0x10000)
#define ECOMPILEOPTIONS_PCRE2_NO_UTF_CHECK    RTS_IEC_UDINT_C(0x40000000)
#define ECOMPILEOPTIONS_PCRE2_UCP    RTS_IEC_UDINT_C(0x20000)
#define ECOMPILEOPTIONS_PCRE2_UNGREEDY    RTS_IEC_UDINT_C(0x40000)
#define ECOMPILEOPTIONS_PCRE2_USE_OFFSET_LIMIT    RTS_IEC_UDINT_C(0x800000)
#define ECOMPILEOPTIONS_PCRE2_UTF    RTS_IEC_UDINT_C(0x80000)
/* Typed enum definition */
#define ECOMPILEOPTIONS    RTS_IEC_UDINT

/**
 * <description>
 * PCRE2 match options.
 * These can be combined using bitwise OR operations.
 * See also: https://pcre2project.github.io/pcre2/doc/html/pcre2_match.html
 * </description>
 * <element name="EMATCHOPTIONS_PCRE2_NOTBOL" type=OUT></element>
 * <element name="EMATCHOPTIONS_PCRE2_NOTEOL" type=OUT></element>
 * <element name="EMATCHOPTIONS_PCRE2_NOTEMPTY" type=OUT></element>
 * <element name="EMATCHOPTIONS_PCRE2_NOTEMPTY_ATSTART" type=OUT></element>
 * <element name="EMATCHOPTIONS_PCRE2_PARTIAL_SOFT" type=OUT></element>
 * <element name="EMATCHOPTIONS_PCRE2_PARTIAL_HARD" type=OUT></element>
 * <element name="EMATCHOPTIONS_PCRE2_SUBSTITUTE_GLOBAL" type=OUT>pcre2_substitute() only</element>
 * <element name="EMATCHOPTIONS_PCRE2_SUBSTITUTE_EXTENDED" type=OUT>pcre2_substitute() only</element>
 * <element name="EMATCHOPTIONS_PCRE2_SUBSTITUTE_UNSET_EMPTY" type=OUT>pcre2_substitute() only</element>
 * <element name="EMATCHOPTIONS_PCRE2_SUBSTITUTE_UNKNOWN_UNSET" type=OUT>pcre2_substitute() only</element>
 * <element name="EMATCHOPTIONS_PCRE2_SUBSTITUTE_OVERFLOW_LENGTH" type=OUT>pcre2_substitute() only</element>
 * <element name="EMATCHOPTIONS_PCRE2_NO_JIT" type=OUT></element>
 * <element name="EMATCHOPTIONS_PCRE2_COPY_MATCHED_SUBJECT" type=OUT></element>
 * <element name="EMATCHOPTIONS_PCRE2_SUBSTITUTE_LITERAL" type=OUT>pcre2_substitute() only</element>
 * <element name="EMATCHOPTIONS_PCRE2_SUBSTITUTE_MATCHED" type=OUT>pcre2_substitute() only</element>
 * <element name="EMATCHOPTIONS_PCRE2_SUBSTITUTE_REPLACEMENT_ONLY" type=OUT>pcre2_substitute() only</element>
*/
#define EMATCHOPTIONS_PCRE2_NOTBOL    RTS_IEC_UDINT_C(0x1)
#define EMATCHOPTIONS_PCRE2_NOTEOL    RTS_IEC_UDINT_C(0x2)
#define EMATCHOPTIONS_PCRE2_NOTEMPTY    RTS_IEC_UDINT_C(0x4)
#define EMATCHOPTIONS_PCRE2_NOTEMPTY_ATSTART    RTS_IEC_UDINT_C(0x8)
#define EMATCHOPTIONS_PCRE2_PARTIAL_SOFT    RTS_IEC_UDINT_C(0x10)
#define EMATCHOPTIONS_PCRE2_PARTIAL_HARD    RTS_IEC_UDINT_C(0x20)
#define EMATCHOPTIONS_PCRE2_SUBSTITUTE_GLOBAL    RTS_IEC_UDINT_C(0x100)
#define EMATCHOPTIONS_PCRE2_SUBSTITUTE_EXTENDED    RTS_IEC_UDINT_C(0x200)
#define EMATCHOPTIONS_PCRE2_SUBSTITUTE_UNSET_EMPTY    RTS_IEC_UDINT_C(0x400)
#define EMATCHOPTIONS_PCRE2_SUBSTITUTE_UNKNOWN_UNSET    RTS_IEC_UDINT_C(0x800)
#define EMATCHOPTIONS_PCRE2_SUBSTITUTE_OVERFLOW_LENGTH    RTS_IEC_UDINT_C(0x1000)
#define EMATCHOPTIONS_PCRE2_NO_JIT    RTS_IEC_UDINT_C(0x2000)
#define EMATCHOPTIONS_PCRE2_COPY_MATCHED_SUBJECT    RTS_IEC_UDINT_C(0x4000)
#define EMATCHOPTIONS_PCRE2_SUBSTITUTE_LITERAL    RTS_IEC_UDINT_C(0x8000)
#define EMATCHOPTIONS_PCRE2_SUBSTITUTE_MATCHED    RTS_IEC_UDINT_C(0x10000)
#define EMATCHOPTIONS_PCRE2_SUBSTITUTE_REPLACEMENT_ONLY    RTS_IEC_UDINT_C(0x20000)
/* Typed enum definition */
#define EMATCHOPTIONS    RTS_IEC_UDINT

/**
 * <description>
 * fucompilepcre_cext
 * </description>
 * <element name="FuCompilePCRE_cext" type=OUT></element>
 * <element name="psPattern" type=IN></element>
 * <element name="udiLength" type=IN></element>
 * <element name="udiOptions" type=IN></element>
*/
typedef struct tagfucompilepcre_cext_struct
{
	RTS_IEC_STRING *psPattern;
	RTS_IEC_UDINT udiLength;
	RTS_IEC_UDINT udiOptions;
	RTS_IEC_XWORD FuCompilePCRE_cext;
} fucompilepcre_cext_struct;

DEF_API(`void',`CDECL',`fucompilepcre_cext',`(fucompilepcre_cext_struct *p)',1,RTSITF_GET_SIGNATURE(0xFC82868E, 0x421E3778),0x00000001)

/**
 * <description>
 * fufreematchpcre_cext
 * </description>
 * <element name="mb" type=IN></element>
*/
typedef struct tagfufreematchpcre_cext_struct
{
	RTS_IEC_XWORD mb;
} fufreematchpcre_cext_struct;

DEF_API(`void',`CDECL',`fufreematchpcre_cext',`(fufreematchpcre_cext_struct *p)',1,RTSITF_GET_SIGNATURE(0xBCBB09E3, 0x33C89557),0x00000001)

/**
 * <description>
 * fufreepcre_cext
 * </description>
 * <element name="re" type=IN></element>
*/
typedef struct tagfufreepcre_cext_struct
{
	RTS_IEC_XWORD re;
} fufreepcre_cext_struct;

DEF_API(`void',`CDECL',`fufreepcre_cext',`(fufreepcre_cext_struct *p)',1,RTSITF_GET_SIGNATURE(0x687603BA, 0x900BA1FF),0x00000001)

/**
 * <description>
 * fugetmatchpcre_cext
 * </description>
 * <element name="FuGetMatchPCRE_cext" type=OUT></element>
 * <element name="mb" type=IN></element>
 * <element name="psSubject" type=IN></element>
 * <element name="udiSubjectLength" type=IN></element>
 * <element name="uiMatchIndex" type=IN></element>
 * <element name="psMatch" type=IN></element>
 * <element name="udiSize" type=IN></element>
 * <element name="udiLength" type=OUT></element>
*/
typedef struct tagfugetmatchpcre_cext_struct
{
	RTS_IEC_XWORD mb;
	RTS_IEC_STRING *psSubject;
	RTS_IEC_UDINT udiSubjectLength;
	RTS_IEC_UINT uiMatchIndex;
	RTS_IEC_STRING *psMatch;
	RTS_IEC_UDINT udiSize;
	RTS_IEC_BOOL FuGetMatchPCRE_cext;
	RTS_IEC_UDINT udiLength;
} fugetmatchpcre_cext_struct;

DEF_API(`void',`CDECL',`fugetmatchpcre_cext',`(fugetmatchpcre_cext_struct *p)',1,RTSITF_GET_SIGNATURE(0x2F591B19, 0xB30220F8),0x00000001)

/**
 * <description>
 * fugetmatchsubstringlengthpcre_cext
 * </description>
 * <element name="FuGetMatchSubstringLengthPCRE_cext" type=OUT></element>
 * <element name="mb" type=IN></element>
 * <element name="uiMatchIndex" type=IN></element>
 * <element name="udiLength" type=OUT></element>
*/
typedef struct tagfugetmatchsubstringlengthpcre_cext_struct
{
	RTS_IEC_XWORD mb;
	RTS_IEC_UINT uiMatchIndex;
	RTS_IEC_BOOL FuGetMatchSubstringLengthPCRE_cext;
	RTS_IEC_UDINT udiLength;
} fugetmatchsubstringlengthpcre_cext_struct;

DEF_API(`void',`CDECL',`fugetmatchsubstringlengthpcre_cext',`(fugetmatchsubstringlengthpcre_cext_struct *p)',1,RTSITF_GET_SIGNATURE(0x9E559D14, 0x803ADBEA),0x00000001)

/**
 * <description>
 * fugetnamedmatchpcre_cext
 * </description>
 * <element name="FuGetNamedMatchPCRE_cext" type=OUT></element>
 * <element name="mb" type=IN></element>
 * <element name="psSubject" type=IN></element>
 * <element name="udiSubjectLength" type=IN></element>
 * <element name="sMatchName" type=IN></element>
 * <element name="udiMatchIndexLength" type=IN></element>
 * <element name="psMatch" type=IN></element>
 * <element name="udiSize" type=IN></element>
 * <element name="udiLength" type=OUT></element>
*/
typedef struct tagfugetnamedmatchpcre_cext_struct
{
	RTS_IEC_XWORD mb;
	RTS_IEC_STRING *psSubject;
	RTS_IEC_UDINT udiSubjectLength;
	RTS_IEC_STRING sMatchName[256];
	RTS_IEC_UDINT udiMatchIndexLength;
	RTS_IEC_STRING *psMatch;
	RTS_IEC_UDINT udiSize;
	RTS_IEC_BOOL FuGetNamedMatchPCRE_cext;
	RTS_IEC_UDINT udiLength;
} fugetnamedmatchpcre_cext_struct;

DEF_API(`void',`CDECL',`fugetnamedmatchpcre_cext',`(fugetnamedmatchpcre_cext_struct *p)',1,RTSITF_GET_SIGNATURE(0x0C461ED5, 0x2698A44E),0x00000001)

/**
 * <description>
 * fugetnamedmatchsubstringlengthpcre_cext
 * </description>
 * <element name="FuGetNamedMatchSubstringLengthPCRE_cext" type=OUT></element>
 * <element name="mb" type=IN></element>
 * <element name="sMatchName" type=IN></element>
 * <element name="udiMatchIndexLength" type=IN></element>
 * <element name="udiLength" type=OUT></element>
*/
typedef struct tagfugetnamedmatchsubstringlengthpcre_cext_struct
{
	RTS_IEC_XWORD mb;
	RTS_IEC_STRING sMatchName[256];
	RTS_IEC_UDINT udiMatchIndexLength;
	RTS_IEC_BOOL FuGetNamedMatchSubstringLengthPCRE_cext;
	RTS_IEC_UDINT udiLength;
} fugetnamedmatchsubstringlengthpcre_cext_struct;

DEF_API(`void',`CDECL',`fugetnamedmatchsubstringlengthpcre_cext',`(fugetnamedmatchsubstringlengthpcre_cext_struct *p)',1,RTSITF_GET_SIGNATURE(0x432E358D, 0x5236ABB1),0x00000001)

/**
 * <description>
 * fumatchpcre_cext
 * </description>
 * <element name="FuMatchPCRE_cext" type=OUT></element>
 * <element name="re" type=IN></element>
 * <element name="psSubject" type=IN></element>
 * <element name="udiLength" type=IN></element>
 * <element name="udiOffset" type=IN></element>
 * <element name="udiOptions" type=IN></element>
 * <element name="mb" type=OUT></element>
*/
typedef struct tagfumatchpcre_cext_struct
{
	RTS_IEC_XWORD re;
	RTS_IEC_STRING *psSubject;
	RTS_IEC_UDINT udiLength;
	RTS_IEC_UDINT udiOffset;
	RTS_IEC_UDINT udiOptions;
	RTS_IEC_INT FuMatchPCRE_cext;
	RTS_IEC_XWORD mb;
} fumatchpcre_cext_struct;

DEF_API(`void',`CDECL',`fumatchpcre_cext',`(fumatchpcre_cext_struct *p)',1,RTSITF_GET_SIGNATURE(0xA2E4C642, 0xB526E963),0x00000001)

/**
 * <description>
 * fusimplematchpcre_cext
 * </description>
 * <element name="FuSimpleMatchPCRE_cext" type=OUT></element>
 * <element name="re" type=IN></element>
 * <element name="psSubject" type=IN></element>
 * <element name="udiLength" type=IN></element>
 * <element name="udiOffset" type=IN></element>
 * <element name="udiOptions" type=IN></element>
*/
typedef struct tagfusimplematchpcre_cext_struct
{
	RTS_IEC_XWORD re;
	RTS_IEC_STRING *psSubject;
	RTS_IEC_UDINT udiLength;
	RTS_IEC_UDINT udiOffset;
	RTS_IEC_UDINT udiOptions;
	RTS_IEC_BOOL FuSimpleMatchPCRE_cext;
} fusimplematchpcre_cext_struct;

DEF_API(`void',`CDECL',`fusimplematchpcre_cext',`(fusimplematchpcre_cext_struct *p)',1,RTSITF_GET_SIGNATURE(0xA6E43AAD, 0xC06C0689),0x00000001)

#ifdef __cplusplus
}
#endif

/** EXTERN LIB SECTION END **/

