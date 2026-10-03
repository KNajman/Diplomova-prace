/**
 * @file    pc_file.c
 * @brief   Přenositelné otevírání souborů pro nástroje na PC (Windows i Linux/Ababel)
 * @author  Bc. Karel Najman
 * @date    2026-10-02
 * @copyright Bc. Karel Najman, Technická univerzita v Liberci
 *
 * Poznámka k volbě:
 *  - Windows (MSVC i MinGW-w64): fopen_s. MSVC označuje fopen jako zastaralé (varování C4996)
 *    a fopen_s navíc otevírá soubor bez sdílení pro zápis, takže se výstup během zápisu nepřepíše.
 *  - Linux (Ababel): glibc fopen_s (C11 Annex K) neimplementuje, takže se použije standardní fopen.
 *  - Annex K se v C11 zapíná makrem __STDC_LIB_EXT1__. Na Linuxu ho žádná běžná knihovna nedefinuje,
 *    proto se rozhoduje podle platformy (_WIN32), ne podle tohoto makra.
 */

#include <pc_file.h>

#include <stddef.h>

/**
 * @brief Otevře soubor přenositelně.
 * @param path  Cesta k souboru
 * @param mode  Režim jako u fopen ("r", "w", "rb", "wb", ...)
 * @return Otevřený soubor, nebo NULL při chybě
 */
FILE* pc_file_open(const char* path, const char* mode)
{
    FILE* file = NULL;

#if defined(_WIN32)
    if (fopen_s(&file, path, mode) != 0)
    {
        file = NULL;    /* fopen_s při chybě vrací kód chyby; ukazatel nemusí být nastaven */
    }
#else
    file = fopen(path, mode);
#endif
    return file;
}
