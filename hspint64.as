;#include"hsp3_64.as"

#ifdef __hsp64__
#regcmd "hsp3cmdinit","hspint64.dll", 4
#cmd int64 $00
#cmd qpeek $01
#cmd qpoke $02
#cmd varptr64 $03
#cmd dupptr64 $04
#cmd callfunc64i $05
#cmd callfunc64d $06
#cmd callfunc64f $07
#cmd cfunc64 $08
#cmd dim64 $09
#cmd float $0A
#cmd fdim $0B
#cmd strw $0C
#cmd swdim $0D
#cmd strwlen $0E
#cmd strwrep $0F
#cmd instrw $10
#cmd strwmid $11
#cmd strwtrim $12
#cmd strwupper $13
#cmd strwlower $14
#cmd strwinsert $15
#cmd strwcomp $16
#cmd libptr64 $17
#cmd callback64_new $18
#cmd callback64_getptr $19
#cmd callback64_getprm $1A
#cmd callback64_setret $1B

#cmd cfunc64v $100
#cmd cfunc64i $101
#cmd cfunc64i64 $102
#cmd cfunc64d $103
#cmd cfunc64f $104
#cmd cfunc64fi $105
#cmd cfunc64s $106
#cmd cfunc64sw $107

#define global RET_VOID			(-1)	// void型用
#define global RET_INT			0		// int型変数で返します
#define global RET_INT64		1		// int64型変数で返します
#define global RET_DOUBLE		2		// double型変数で返します
#define global RET_FLOAT		3		// float型変数で返します
#define global RET_FLOAT_INT	4		// float値をint型変数で返します
#define global RET_STR			5		// 文字列型で返します
#define global RET_STRW			6		// Unicode文字列型(UTF-16)で返します
#define global RET_CALLBACK64	7		// Callback64型で返します

#define global ctype L(%1) strw(%1)
#define global ctype _T(%1) L(%1)
#else
// 32bit版（まだないけど）
#define global ctype _T(%1) %1
#define global CANCEL_UNDEF_HSPINT64
#endif

// 取り消し
#ifndef CANCEL_UNDEF_HSPINT64
#undef varptr@hsp
#undef callfunc@hsp
#undef dupptr@hsp
#undef libptr@hsp
#define global varptr@hsp varptr64
#define global callfunc@hsp callfunc64i
#define global dupptr@hsp dupptr64
#define global libptr@hsp libptr64
#endif
