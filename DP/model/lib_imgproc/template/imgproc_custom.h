/**
 * @file    imgproc_custom.h
 * @brief   Uživatelská konfigurace knihovny lib_imgproc (šablona - zkopírovat do projektu)
 * @author  Bc. Karel Najman
 * @date    2026-10-02
 * @copyright Bc. Karel Najman, Technická univerzita v Liberci
 */

#ifndef IMGPROC_CUSTOM_H_
#define IMGPROC_CUSTOM_H_

#include <stdlib.h>

#ifdef __cplusplus
extern "C" {
#endif

/**
 * Ošetření chyb způsobených nesprávným použitím (neplatné parametry).
 *
 * Poznámka k volbě: standardní assert() se v Release buildu (-DNDEBUG, výchozí u CMake) úplně
 * vypustí. Kontrola pak zmizí a překladač navíc hlásí nepoužité parametry (u -Werror = chyba
 * překladu). Jablotron standard pro kontrolu i v release buildu doporučuje abort(), proto je
 * kontrola aktivní vždy. Kontroly jsou jen na vstupu funkcí (ne pro každý pixel), takže měření
 * rychlosti SW na A53 neovlivní.
 */
#define IMGPROC_ASSERT(cond)        \
    do                              \
    {                               \
        if (!(cond))                \
        {                           \
            abort();                \
        }                           \
    } while (0)

/// Maximální podporovaná šířka obrazu (odpovídá generiku G_MAX_WIDTH v HW)
#define IMGPROC_MAX_WIDTH       (3840u)

/// Maximální podporovaná výška obrazu
#define IMGPROC_MAX_HEIGHT      (2160u)

#ifdef __cplusplus
}
#endif

#endif /* IMGPROC_CUSTOM_H_ */
