// This is a C file for CODESYS to expose PCRE2 regex to CODESYS
// We will only expose a way to create PCRE2 compiled patterns, matching and freeing compiled patterns

// Cross-compiling for armv7 with: arm-linux-gnueabihf-gcc
// Compile using "make all" (requires extension_sdk to be present)

#define PCRE2_STATIC
#define PCRE2_CODE_UNIT_WIDTH 8

// Normal includes
#include <string.h>
#include <pcre2.h>
// ---

// CODESYS includes
#include "CmpStd.h"
#include "CmpErrors.h"
#include "CmpItf.h"
#include "PCRE2Dep.h"
// ---

// Compile given pattern
void CDECL CDECL_EXT fucompilepcre_cext(fucompilepcre_cext_struct *p) {
    pcre2_code *re;
    int errornumber;
    PCRE2_SIZE erroroffset;

    // Invalid pattern pointer
    if (p->psPattern == 0) {
        p->FuCompilePCRE_cext = 0;
        return;
    }

    re = pcre2_compile(
        (PCRE2_SPTR)p->psPattern,
        (PCRE2_SIZE)p->udiLength,
        (uint32_t)p->udiOptions,
        &errornumber,               // for error number
        &erroroffset,               // for error offset
        NULL                        // use default compile context
    );

    // re is NULL if compilation failed
    if (re == NULL) {
        p->FuCompilePCRE_cext = 0;
    } else {
        p->FuCompilePCRE_cext = (RTS_IEC_XWORD)re;
    }
}

// Free (release) the match block
void CDECL CDECL_EXT fufreematchpcre_cext(fufreematchpcre_cext_struct *p) {
    pcre2_match_data *match_data;

    if (p->mb != 0) {
        match_data = (pcre2_match_data*)p->mb;
        pcre2_match_data_free(match_data);
    }
}

// Free (release) the compiled pattern
void CDECL CDECL_EXT fufreepcre_cext(fufreepcre_cext_struct *p) {
    pcre2_code *re;

    if (p->re != 0) {
        re = (pcre2_code*)p->re;
        pcre2_code_free(re);
    }
}

// Get a match string from the match block (may return partial substrings due to "buffer" size)
void CDECL CDECL_EXT fugetmatchpcre_cext(fugetmatchpcre_cext_struct *p) {
    pcre2_match_data *match_data;
    PCRE2_SIZE *ovector;

    unsigned long ovec;
    int count;
    PCRE2_SIZE len;
    int index;

    // Set default value
    p->udiLength = 0;

    // Invalid match block or subject or match pointer
    if (p->mb == 0 || p->psSubject == 0 || p->psMatch == 0) {
        p->FuGetMatchPCRE_cext = 0;
        return;
    }

    match_data = (pcre2_match_data*)p->mb;

    // Clear string first
    memset((void*)p->psMatch, 0, (size_t)p->udiSize);

    count = pcre2_get_ovector_count(match_data);
    index = p->uiMatchIndex + 1;

    if (count <= index) {
        p->FuGetMatchPCRE_cext = 0;
        return;
    }

    ovector = pcre2_get_ovector_pointer(match_data);

    len = MIN((PCRE2_SIZE)p->udiSize, (PCRE2_SIZE)(ovector[2 * index + 1] - ovector[2 * index]));
    p->udiLength = (RTS_IEC_UDINT)len;

    ovec = (unsigned long)p->psSubject + (unsigned long)ovector[2 * index];
    memcpy((void*)p->psMatch, (void*)ovec, (size_t)len);

    p->FuGetMatchPCRE_cext = 1;
}

// Get the length of a match substring by match index (number)
void CDECL CDECL_EXT fugetmatchsubstringlengthpcre_cext(fugetmatchsubstringlengthpcre_cext_struct *p) {
    pcre2_match_data *match_data;
    PCRE2_SIZE index;
    PCRE2_SIZE length;

    // Set default value
    p->udiLength = 0;

    // Invalid match block pointer
    if (p->mb == 0) {
        p->FuGetMatchSubstringLengthPCRE_cext = 0;
        return;
    }

    match_data = (pcre2_match_data*)p->mb;
    index = p->uiMatchIndex + 1;

    if (pcre2_substring_length_bynumber(match_data, index, &length) < 0) {
        p->FuGetMatchSubstringLengthPCRE_cext = 0;
        return;
    }

    p->udiLength = (RTS_IEC_UDINT)length;
    p->FuGetMatchSubstringLengthPCRE_cext = 1;
}

// Get a named match string from the match block (may NOT return partial substrings due to "buffer" size)
void CDECL CDECL_EXT fugetnamedmatchpcre_cext(fugetnamedmatchpcre_cext_struct *p) {
    pcre2_code *re;
    pcre2_match_data *match_data;
    PCRE2_SIZE length;

    // Set default value
    p->udiLength = 0;

    // Invalid match block or subject or match pointer
    if (p->mb == 0 || p->psSubject == 0 || p->psMatch == 0) {
        p->FuGetNamedMatchPCRE_cext = 0;
        return;
    }

    match_data = (pcre2_match_data*)p->mb;

    // Clear string first
    memset((void*)p->psMatch, 0, (size_t)p->udiSize);

    // Set len to udiSize (len will get updated)
    length = (PCRE2_SIZE)p->udiSize;

    if (pcre2_substring_copy_byname(match_data, (PCRE2_SPTR)p->sMatchName, (PCRE2_UCHAR*)p->psMatch, &length) < 0) {
        p->FuGetNamedMatchPCRE_cext = 0;
        return;
    }

    p->udiLength = (RTS_IEC_UDINT)length;
    p->FuGetNamedMatchPCRE_cext = 1;
}

// Get the length of a match substring by match name
void CDECL CDECL_EXT fugetnamedmatchsubstringlengthpcre_cext(fugetnamedmatchsubstringlengthpcre_cext_struct *p) {
    pcre2_match_data *match_data;
    PCRE2_SIZE length;

    // Set default value
    p->udiLength = 0;

    // Invalid match block pointer
    if (p->mb == 0) {
        p->FuGetNamedMatchSubstringLengthPCRE_cext = 0;
        return;
    }

    match_data = (pcre2_match_data*)p->mb;

    if (pcre2_substring_length_byname(match_data, (PCRE2_SPTR)p->sMatchName, &length) < 0) {
        p->FuGetNamedMatchSubstringLengthPCRE_cext = 0;
        return;
    }

    p->udiLength = (RTS_IEC_UDINT)length;
    p->FuGetNamedMatchSubstringLengthPCRE_cext = 1;
}

// Match a compiled pattern (with retaining match block)
void CDECL CDECL_EXT fumatchpcre_cext(fumatchpcre_cext_struct *p) {
    pcre2_code *re;
    int rc;
    pcre2_match_data *match_data;

    // Set default value
    p->mb = 0;

    // Invalid compiled pattern or subject pointer
    if (p->re == 0 || p->psSubject == 0) {
        p->FuMatchPCRE_cext = PCRE2_ERROR_NULL;
        return;
    }

    re = (pcre2_code*)p->re;    
    match_data = pcre2_match_data_create_from_pattern(re, NULL);

    rc = pcre2_match(
        re,
        (PCRE2_SPTR)p->psSubject,
        (PCRE2_SIZE)p->udiLength,
        (PCRE2_SIZE)p->udiOffset,
        (uint32_t)p->udiOptions,
        match_data,                 // block for storing the result
        NULL                        // use default match context
    );

    if (rc > 0) {
        p->FuMatchPCRE_cext = rc - 1;
    } else {
        p->FuMatchPCRE_cext = rc;
    }

    if (rc < 1) { // We don't have any matches, release the match data
        pcre2_match_data_free(match_data);
        return;
    }

    p->mb = (RTS_IEC_XWORD)match_data;
}

// Match the compiled pattern against the subject (simple boolean check)
void CDECL CDECL_EXT fusimplematchpcre_cext(fusimplematchpcre_cext_struct *p) {
    pcre2_code *re;
    int rc;
    pcre2_match_data *match_data;

    // Invalid compiled pattern or subject pointer
    if (p->re == 0 || p->psSubject == 0) {
        p->FuSimpleMatchPCRE_cext = 0;
        return;
    }

    re = (pcre2_code*)p->re;    
    match_data = pcre2_match_data_create_from_pattern(re, NULL);

    rc = pcre2_match(
        re,
        (PCRE2_SPTR)p->psSubject,
        (PCRE2_SIZE)p->udiLength,
        (PCRE2_SIZE)p->udiOffset,
        (uint32_t)p->udiOptions,
        match_data,                 // block for storing the result
        NULL                        // use default match context
    );

    pcre2_match_data_free(match_data); // Release memory used for the match

    // rc < 0 = Matching failed
    // rc == 0 = Not enough space in match block (should never happen)
    p->FuSimpleMatchPCRE_cext = (RTS_IEC_BOOL)(rc > 0);
}
