/**
 * @file    pc_file.h
 * @brief   Přenositelné otevírání souborů pro nástroje na PC (Windows i Linux/Ababel)
 * @author  Bc. Karel Najman
 * @date    2026-10-02
 * @copyright Bc. Karel Najman, Technická univerzita v Liberci
 */

#ifndef TOOLS_PC_FILE_H_
#define TOOLS_PC_FILE_H_

#include <stdio.h>

#ifdef __cplusplus
extern "C" {
#endif

/// Otevře soubor (na Windows přes fopen_s, jinde přes fopen); při chybě vrací NULL
FILE* pc_file_open(const char* path, const char* mode);

#ifdef __cplusplus
}
#endif

#endif /* TOOLS_PC_FILE_H_ */
