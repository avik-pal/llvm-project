; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt -S -passes=instcombine < %s | FileCheck %s

define half @copysign_fneg_x(half %x, half %y) {
; CHECK-LABEL: @copysign_fneg_x(
; CHECK-NEXT:    [[COPYSIGN:%.*]] = call half @llvm.copysign.f16(half [[X:%.*]], half [[Y:%.*]])
; CHECK-NEXT:    ret half [[COPYSIGN]]
;
  %fneg.x = fneg half %x
  %copysign = call half @llvm.copysign.f16(half %fneg.x, half %y)
  ret half %copysign
}

define half @copysign_fabs_x(half %x, half %y) {
; CHECK-LABEL: @copysign_fabs_x(
; CHECK-NEXT:    [[COPYSIGN:%.*]] = call half @llvm.copysign.f16(half [[X:%.*]], half [[Y:%.*]])
; CHECK-NEXT:    ret half [[COPYSIGN]]
;
  %fabs.x = call half @llvm.fabs.f16(half %x)
  %copysign = call half @llvm.copysign.f16(half %fabs.x, half %y)
  ret half %copysign
}

define half @copysign_fneg_fabs_x(half %x, half %y) {
; CHECK-LABEL: @copysign_fneg_fabs_x(
; CHECK-NEXT:    [[COPYSIGN:%.*]] = call half @llvm.copysign.f16(half [[X:%.*]], half [[Y:%.*]])
; CHECK-NEXT:    ret half [[COPYSIGN]]
;
  %fabs.x = call half @llvm.fabs.f16(half %x)
  %fneg.fabs.x = fneg half %fabs.x
  %copysign = call half @llvm.copysign.f16(half %fneg.fabs.x, half %y)
  ret half %copysign
}

define half @copysign_fneg_y(half %x, half %y) {
; CHECK-LABEL: @copysign_fneg_y(
; CHECK-NEXT:    [[FNEG_Y:%.*]] = fneg half [[Y:%.*]]
; CHECK-NEXT:    [[COPYSIGN:%.*]] = call half @llvm.copysign.f16(half [[X:%.*]], half [[FNEG_Y]])
; CHECK-NEXT:    ret half [[COPYSIGN]]
;
  %fneg.y = fneg half %y
  %copysign = call half @llvm.copysign.f16(half %x, half %fneg.y)
  ret half %copysign
}

define half @copysign_fabs_y(half %x, half %y) {
; CHECK-LABEL: @copysign_fabs_y(
; CHECK-NEXT:    [[COPYSIGN:%.*]] = call half @llvm.fabs.f16(half [[X:%.*]])
; CHECK-NEXT:    ret half [[COPYSIGN]]
;
  %fabs.y = call half @llvm.fabs.f16(half %y)
  %copysign = call half @llvm.copysign.f16(half %x, half %fabs.y)
  ret half %copysign
}

define half @copysign_fneg_fabs_y(half %x, half %y) {
; CHECK-LABEL: @copysign_fneg_fabs_y(
; CHECK-NEXT:    [[TMP1:%.*]] = call half @llvm.fabs.f16(half [[X:%.*]])
; CHECK-NEXT:    [[COPYSIGN:%.*]] = fneg half [[TMP1]]
; CHECK-NEXT:    ret half [[COPYSIGN]]
;
  %fabs.y = call half @llvm.fabs.f16(half %y)
  %fneg.fabs.y = fneg half %fabs.y
  %copysign = call half @llvm.copysign.f16(half %x, half %fneg.fabs.y)
  ret half %copysign
}

define half @fneg_copysign(half %x, half %y) {
; CHECK-LABEL: @fneg_copysign(
; CHECK-NEXT:    [[TMP1:%.*]] = fneg half [[Y:%.*]]
; CHECK-NEXT:    [[FNEG_COPYSIGN:%.*]] = call half @llvm.copysign.f16(half [[X:%.*]], half [[TMP1]])
; CHECK-NEXT:    ret half [[FNEG_COPYSIGN]]
;
  %copysign = call half @llvm.copysign.f16(half %x, half %y)
  %fneg.copysign = fneg half %copysign
  ret half %fneg.copysign
}

define half @fneg_fabs_copysign(half %x, half %y) {
; CHECK-LABEL: @fneg_fabs_copysign(
; CHECK-NEXT:    [[FABS_COPYSIGN:%.*]] = call half @llvm.fabs.f16(half [[X:%.*]])
; CHECK-NEXT:    [[FNEG_FABS_COPYSIGN:%.*]] = fneg half [[FABS_COPYSIGN]]
; CHECK-NEXT:    ret half [[FNEG_FABS_COPYSIGN]]
;
  %copysign = call half @llvm.copysign.f16(half %x, half %y)
  %fabs.copysign = call half @llvm.fabs.f16(half %copysign)
  %fneg.fabs.copysign = fneg half %fabs.copysign
  ret half %fneg.fabs.copysign
}

; https://alive2.llvm.org/ce/z/Ft-7ea
define half @fabs_copysign(half %x, half %y) {
; CHECK-LABEL: @fabs_copysign(
; CHECK-NEXT:    [[FABS_COPYSIGN:%.*]] = call half @llvm.fabs.f16(half [[X:%.*]])
; CHECK-NEXT:    ret half [[FABS_COPYSIGN]]
;
  %copysign = call half @llvm.copysign.f16(half %x, half %y)
  %fabs.copysign = call half @llvm.fabs.f16(half %copysign)
  ret half %fabs.copysign
}

define <2 x half> @fneg_copysign_vector(<2 x half> %x, <2 x half> %y) {
; CHECK-LABEL: @fneg_copysign_vector(
; CHECK-NEXT:    [[TMP1:%.*]] = fneg <2 x half> [[Y:%.*]]
; CHECK-NEXT:    [[FNEG_COPYSIGN:%.*]] = call <2 x half> @llvm.copysign.v2f16(<2 x half> [[X:%.*]], <2 x half> [[TMP1]])
; CHECK-NEXT:    ret <2 x half> [[FNEG_COPYSIGN]]
;
  %copysign = call <2 x half> @llvm.copysign.v2f16(<2 x half> %x, <2 x half> %y)
  %fneg.copysign = fneg <2 x half> %copysign
  ret <2 x half> %fneg.copysign
}

define <2 x half> @fneg_fabs_copysign_vector(<2 x half> %x, <2 x half> %y) {
; CHECK-LABEL: @fneg_fabs_copysign_vector(
; CHECK-NEXT:    [[FABS_COPYSIGN:%.*]] = call <2 x half> @llvm.fabs.v2f16(<2 x half> [[X:%.*]])
; CHECK-NEXT:    [[FNEG_FABS_COPYSIGN:%.*]] = fneg <2 x half> [[FABS_COPYSIGN]]
; CHECK-NEXT:    ret <2 x half> [[FNEG_FABS_COPYSIGN]]
;
  %copysign = call <2 x half> @llvm.copysign.v2f16(<2 x half> %x, <2 x half> %y)
  %fabs.copysign = call <2 x half> @llvm.fabs.v2f16(<2 x half> %copysign)
  %fneg.fabs.copysign = fneg <2 x half> %fabs.copysign
  ret <2 x half> %fneg.fabs.copysign
}

define <2 x half> @fabs_copysign_vector(<2 x half> %x, <2 x half> %y) {
; CHECK-LABEL: @fabs_copysign_vector(
; CHECK-NEXT:    [[FABS_COPYSIGN:%.*]] = call <2 x half> @llvm.fabs.v2f16(<2 x half> [[X:%.*]])
; CHECK-NEXT:    ret <2 x half> [[FABS_COPYSIGN]]
;
  %copysign = call <2 x half> @llvm.copysign.v2f16(<2 x half> %x, <2 x half> %y)
  %fabs.copysign = call <2 x half> @llvm.fabs.v2f16(<2 x half> %copysign)
  ret <2 x half> %fabs.copysign
}

define half @fneg_copysign_flags(half %x, half %y) {
; CHECK-LABEL: @fneg_copysign_flags(
; CHECK-NEXT:    [[TMP1:%.*]] = fneg nsz half [[Y:%.*]]
; CHECK-NEXT:    [[FNEG_COPYSIGN:%.*]] = call nsz half @llvm.copysign.f16(half [[X:%.*]], half [[TMP1]])
; CHECK-NEXT:    ret half [[FNEG_COPYSIGN]]
;
  %copysign = call nnan nsz half @llvm.copysign.f16(half %x, half %y)
  %fneg.copysign = fneg ninf nsz half %copysign
  ret half %fneg.copysign
}

define half @fneg_fabs_copysign_flags(half %x, half %y) {
; CHECK-LABEL: @fneg_fabs_copysign_flags(
; CHECK-NEXT:    [[FABS_COPYSIGN:%.*]] = call nnan ninf afn half @llvm.fabs.f16(half [[X:%.*]])
; CHECK-NEXT:    [[FNEG_FABS_COPYSIGN:%.*]] = fneg reassoc ninf half [[FABS_COPYSIGN]]
; CHECK-NEXT:    ret half [[FNEG_FABS_COPYSIGN]]
;
  %copysign = call nnan nsz ninf half @llvm.copysign.f16(half %x, half %y)
  %fabs.copysign = call nnan afn ninf half @llvm.fabs.f16(half %copysign)
  %fneg.fabs.copysign = fneg reassoc ninf half %fabs.copysign
  ret half %fneg.fabs.copysign
}

; Make sure we don't break things by polluting copysign with nsz
define half @fneg_nsz_copysign(half %x, half %y) {
; CHECK-LABEL: @fneg_nsz_copysign(
; CHECK-NEXT:    [[TMP1:%.*]] = fneg half [[Y:%.*]]
; CHECK-NEXT:    [[FNEG_COPYSIGN:%.*]] = call half @llvm.copysign.f16(half [[X:%.*]], half [[TMP1]])
; CHECK-NEXT:    ret half [[FNEG_COPYSIGN]]
;
  %copysign = call half @llvm.copysign.f16(half %x, half %y)
  %fneg.copysign = fneg nsz half %copysign
  ret half %fneg.copysign
}

define half @fneg_fabs_copysign_flags_none_fabs(half %x, half %y) {
; CHECK-LABEL: @fneg_fabs_copysign_flags_none_fabs(
; CHECK-NEXT:    [[FABS_COPYSIGN:%.*]] = call half @llvm.fabs.f16(half [[X:%.*]])
; CHECK-NEXT:    [[FNEG_FABS_COPYSIGN:%.*]] = fneg fast half [[FABS_COPYSIGN]]
; CHECK-NEXT:    ret half [[FNEG_FABS_COPYSIGN]]
;
  %copysign = call nnan nsz ninf half @llvm.copysign.f16(half %x, half %y)
  %fabs.copysign = call half @llvm.fabs.f16(half %copysign)
  %fneg.fabs.copysign = fneg fast half %fabs.copysign
  ret half %fneg.fabs.copysign
}

define half @fabs_copysign_flags(half %x, half %y) {
; CHECK-LABEL: @fabs_copysign_flags(
; CHECK-NEXT:    [[FABS_COPYSIGN:%.*]] = call nnan nsz half @llvm.fabs.f16(half [[X:%.*]])
; CHECK-NEXT:    ret half [[FABS_COPYSIGN]]
;
  %copysign = call nnan half @llvm.copysign.f16(half %x, half %y)
  %fabs.copysign = call nsz nnan half @llvm.fabs.f16(half %copysign)
  ret half %fabs.copysign
}

define half @fabs_copysign_all_flags(half %x, half %y) {
; CHECK-LABEL: @fabs_copysign_all_flags(
; CHECK-NEXT:    [[FABS_COPYSIGN:%.*]] = call fast half @llvm.fabs.f16(half [[X:%.*]])
; CHECK-NEXT:    ret half [[FABS_COPYSIGN]]
;
  %copysign = call fast half @llvm.copysign.f16(half %x, half %y)
  %fabs.copysign = call fast half @llvm.fabs.f16(half %copysign)
  ret half %fabs.copysign
}

define half @fabs_copysign_no_flags_copysign_user(half %x, half %y, ptr %ptr) {
; CHECK-LABEL: @fabs_copysign_no_flags_copysign_user(
; CHECK-NEXT:    [[COPYSIGN:%.*]] = call half @llvm.copysign.f16(half [[X:%.*]], half [[Y:%.*]])
; CHECK-NEXT:    store half [[COPYSIGN]], ptr [[PTR:%.*]], align 2
; CHECK-NEXT:    [[FABS_COPYSIGN:%.*]] = call fast half @llvm.fabs.f16(half [[X]])
; CHECK-NEXT:    ret half [[FABS_COPYSIGN]]
;
  %copysign = call half @llvm.copysign.f16(half %x, half %y)
  store half %copysign, ptr %ptr
  %fabs.copysign = call fast half @llvm.fabs.f16(half %copysign)
  ret half %fabs.copysign
}

define half @fneg_fabs_copysign_drop_flags(half %x, half %y) {
; CHECK-LABEL: @fneg_fabs_copysign_drop_flags(
; CHECK-NEXT:    [[FABS_COPYSIGN:%.*]] = call ninf half @llvm.fabs.f16(half [[X:%.*]])
; CHECK-NEXT:    [[FNEG_FABS_COPYSIGN:%.*]] = fneg nsz half [[FABS_COPYSIGN]]
; CHECK-NEXT:    ret half [[FNEG_FABS_COPYSIGN]]
;
  %copysign = call nnan half @llvm.copysign.f16(half %x, half %y)
  %fabs.copysign = call ninf half @llvm.fabs.f16(half %copysign)
  %fneg.fabs.copysign = fneg nsz half %fabs.copysign
  ret half %fneg.fabs.copysign
}

define half @fneg_copysign_multi_use(half %x, half %y, ptr %ptr) {
; CHECK-LABEL: @fneg_copysign_multi_use(
; CHECK-NEXT:    [[COPYSIGN:%.*]] = call half @llvm.copysign.f16(half [[X:%.*]], half [[Y:%.*]])
; CHECK-NEXT:    store half [[COPYSIGN]], ptr [[PTR:%.*]], align 2
; CHECK-NEXT:    [[FNEG_COPYSIGN:%.*]] = fneg half [[COPYSIGN]]
; CHECK-NEXT:    ret half [[FNEG_COPYSIGN]]
;
  %copysign = call half @llvm.copysign.f16(half %x, half %y)
  store half %copysign, ptr %ptr
  %fneg.copysign = fneg half %copysign
  ret half %fneg.copysign
}

define half @fabs_copysign_multi_use(half %x, half %y, ptr %ptr) {
; CHECK-LABEL: @fabs_copysign_multi_use(
; CHECK-NEXT:    [[COPYSIGN:%.*]] = call half @llvm.copysign.f16(half [[X:%.*]], half [[Y:%.*]])
; CHECK-NEXT:    store half [[COPYSIGN]], ptr [[PTR:%.*]], align 2
; CHECK-NEXT:    [[FABS_COPYSIGN:%.*]] = call half @llvm.fabs.f16(half [[X]])
; CHECK-NEXT:    ret half [[FABS_COPYSIGN]]
;
  %copysign = call half @llvm.copysign.f16(half %x, half %y)
  store half %copysign, ptr %ptr
  %fabs.copysign = call half @llvm.fabs.f16(half %copysign)
  ret half %fabs.copysign
}

define half @fabs_flags_copysign_multi_use(half %x, half %y, ptr %ptr) {
; CHECK-LABEL: @fabs_flags_copysign_multi_use(
; CHECK-NEXT:    [[COPYSIGN:%.*]] = call half @llvm.copysign.f16(half [[X:%.*]], half [[Y:%.*]])
; CHECK-NEXT:    store half [[COPYSIGN]], ptr [[PTR:%.*]], align 2
; CHECK-NEXT:    [[FABS_COPYSIGN:%.*]] = call nnan ninf half @llvm.fabs.f16(half [[X]])
; CHECK-NEXT:    ret half [[FABS_COPYSIGN]]
;
  %copysign = call half @llvm.copysign.f16(half %x, half %y)
  store half %copysign, ptr %ptr
  %fabs.copysign = call ninf nnan half @llvm.fabs.f16(half %copysign)
  ret half %fabs.copysign
}

define half @fneg_fabs_copysign_multi_use_fabs(half %x, half %y, ptr %ptr) {
; CHECK-LABEL: @fneg_fabs_copysign_multi_use_fabs(
; CHECK-NEXT:    [[FABS_COPYSIGN:%.*]] = call half @llvm.fabs.f16(half [[X:%.*]])
; CHECK-NEXT:    store half [[FABS_COPYSIGN]], ptr [[PTR:%.*]], align 2
; CHECK-NEXT:    ret half [[FABS_COPYSIGN]]
;
  %copysign = call half @llvm.copysign.f16(half %x, half %y)
  %fabs.copysign = call half @llvm.fabs.f16(half %copysign)
  store half %fabs.copysign, ptr %ptr
  ret half %fabs.copysign
}

define half @copysign_pos(half %a) {
; CHECK-LABEL: @copysign_pos(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[RET:%.*]] = call half @llvm.copysign.f16(half 0xH3C00, half [[A:%.*]])
; CHECK-NEXT:    ret half [[RET]]
;
entry:
  %ret = call half @llvm.copysign.f16(half 0xH3C00, half %a)
  ret half %ret
}

define half @copysign_neg(half %a) {
; CHECK-LABEL: @copysign_neg(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[RET:%.*]] = call half @llvm.copysign.f16(half 0xH3C00, half [[A:%.*]])
; CHECK-NEXT:    ret half [[RET]]
;
entry:
  %ret = call half @llvm.copysign.f16(half 0xHBC00, half %a)
  ret half %ret
}

define half @copysign_negzero(half %a) {
; CHECK-LABEL: @copysign_negzero(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[RET:%.*]] = call half @llvm.copysign.f16(half 0xH0000, half [[A:%.*]])
; CHECK-NEXT:    ret half [[RET]]
;
entry:
  %ret = call half @llvm.copysign.f16(half 0xH8000, half %a)
  ret half %ret
}

define half @copysign_negnan(half %a) {
; CHECK-LABEL: @copysign_negnan(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[RET:%.*]] = call half @llvm.copysign.f16(half 0xH7E00, half [[A:%.*]])
; CHECK-NEXT:    ret half [[RET]]
;
entry:
  %ret = call half @llvm.copysign.f16(half 0xHFE00, half %a)
  ret half %ret
}

define half @copysign_neginf(half %a) {
; CHECK-LABEL: @copysign_neginf(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[RET:%.*]] = call half @llvm.copysign.f16(half 0xH7C00, half [[A:%.*]])
; CHECK-NEXT:    ret half [[RET]]
;
entry:
  %ret = call half @llvm.copysign.f16(half 0xHFC00, half %a)
  ret half %ret
}

define <4 x half> @copysign_splat(<4 x half> %a) {
; CHECK-LABEL: @copysign_splat(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[RET:%.*]] = call <4 x half> @llvm.copysign.v4f16(<4 x half> splat (half 0xH3C00), <4 x half> [[A:%.*]])
; CHECK-NEXT:    ret <4 x half> [[RET]]
;
entry:
  %ret = call <4 x half> @llvm.copysign.v4f16(<4 x half> splat(half 0xHBC00), <4 x half> %a)
  ret <4 x half> %ret
}

; TODO: Support constant folding of fabs

define <4 x half> @copysign_vec4(<4 x half> %a) {
; CHECK-LABEL: @copysign_vec4(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[RET:%.*]] = call <4 x half> @llvm.copysign.v4f16(<4 x half> <half 0xH3C00, half 0xHBC00, half undef, half poison>, <4 x half> [[A:%.*]])
; CHECK-NEXT:    ret <4 x half> [[RET]]
;
entry:
  %ret = call <4 x half> @llvm.copysign.v4f16(<4 x half> <half 0xH3C00, half 0xHBC00, half undef, half poison>, <4 x half> %a)
  ret <4 x half> %ret
}

declare half @llvm.fabs.f16(half)
declare <2 x half> @llvm.fabs.v2f16(<2 x half>)
declare half @llvm.copysign.f16(half, half)
declare <2 x half> @llvm.copysign.v2f16(<2 x half>, <2 x half>)
