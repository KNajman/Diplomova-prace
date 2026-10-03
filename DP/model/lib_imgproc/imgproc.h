/**
 * @file    imgproc.h
 * @brief   Golden model algoritmů zpracování obrazu pro DP (C model pro HLS, VHDL testbenche a SW na A53)
 * @author  Bc. Karel Najman
 * @date    2026-10-02
 * @copyright Bc. Karel Najman, Technická univerzita v Liberci
 *
 * Hlavní include knihovny lib_imgproc. Knihovna nealokuje paměť, nepoužívá stdio
 * a je přeložitelná pro bare-metal Cortex-A53 i pro PC (testbenche, generátory).
 */

#ifndef LIB_IMGPROC_IMGPROC_H_
#define LIB_IMGPROC_IMGPROC_H_

#include <imgproc/types.h>
#include <imgproc/image.h>
#include <imgproc/csc.h>
#include <imgproc/hsv.h>
#include <imgproc/threshold.h>
#include <imgproc/filter.h>
#include <imgproc/median.h>
#include <imgproc/histogram.h>

#ifdef __cplusplus
extern "C" {
#endif

#define IMGPROC_VERSION_MAJOR   (0u)    ///< Verze knihovny - major
#define IMGPROC_VERSION_MINOR   (1u)    ///< Verze knihovny - minor

#ifdef __cplusplus
}
#endif

#endif /* LIB_IMGPROC_IMGPROC_H_ */
