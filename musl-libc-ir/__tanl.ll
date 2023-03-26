; ModuleID = 'src/math/__tanl.c'
source_filename = "src/math/__tanl.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define hidden x86_fp80 @__tanl(x86_fp80 noundef %0, x86_fp80 noundef %1, i32 noundef %2) local_unnamed_addr #0 {
  %4 = tail call x86_fp80 @fabsl(x86_fp80 noundef %0) #3
  %5 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 6.743400e-01, metadata !"fpexcept.ignore") #4
  %6 = tail call i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80 %4, x86_fp80 %5, metadata !"oge", metadata !"fpexcept.ignore") #4
  br i1 %6, label %7, label %19

7:                                                ; preds = %3
  %8 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %9 = tail call i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80 %0, x86_fp80 %8, metadata !"olt", metadata !"fpexcept.ignore") #4
  %10 = fneg x86_fp80 %0
  %11 = fneg x86_fp80 %1
  %12 = select i1 %9, x86_fp80 %11, x86_fp80 %1
  %13 = select i1 %9, x86_fp80 %10, x86_fp80 %0
  %14 = zext i1 %9 to i32
  %15 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 0xK3FFEC90FDAA22168C235, x86_fp80 %13, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %16 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 0xKBFBCECE675D1FC8F8CBB, x86_fp80 %12, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %17 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %15, x86_fp80 %16, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %18 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0.000000e+00, metadata !"fpexcept.ignore") #4
  br label %19

19:                                               ; preds = %7, %3
  %20 = phi x86_fp80 [ %18, %7 ], [ %1, %3 ]
  %21 = phi x86_fp80 [ %17, %7 ], [ %0, %3 ]
  %22 = phi i32 [ %14, %7 ], [ undef, %3 ]
  %23 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %21, x86_fp80 %21, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %24 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %23, x86_fp80 %23, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %25 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0x3F9664F4882CC1C2, metadata !"fpexcept.ignore") #4
  %26 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0x3F6D6D3D185D7FF8, metadata !"fpexcept.ignore") #4
  %27 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0x3F43559358685B83, metadata !"fpexcept.ignore") #4
  %28 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0x3F1977EFC26806F4, metadata !"fpexcept.ignore") #4
  %29 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0x3EF2F5E563E5487E, metadata !"fpexcept.ignore") #4
  %30 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0x3EE06B59141A6CB3, metadata !"fpexcept.ignore") #4
  %31 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0x3EC3835436C0C87F, metadata !"fpexcept.ignore") #4
  %32 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %24, x86_fp80 %31, x86_fp80 %30, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %33 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %24, x86_fp80 %32, x86_fp80 %29, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %34 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %24, x86_fp80 %33, x86_fp80 %28, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %35 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %24, x86_fp80 %34, x86_fp80 %27, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %36 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %24, x86_fp80 %35, x86_fp80 %26, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %37 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %24, x86_fp80 %36, x86_fp80 %25, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %38 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %24, x86_fp80 %37, x86_fp80 0xK3FFC88888888888893C3, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %39 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0x3F8226E355C17612, metadata !"fpexcept.ignore") #4
  %40 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0x3F57DA354AA3F96B, metadata !"fpexcept.ignore") #4
  %41 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0x3F2F56242026B5BE, metadata !"fpexcept.ignore") #4
  %42 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0x3F04275A09B3CEAC, metadata !"fpexcept.ignore") #4
  %43 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0x3EC44C0D80CC6896, metadata !"fpexcept.ignore") #4
  %44 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0xBECB5ABEF3BA4B59, metadata !"fpexcept.ignore") #4
  %45 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %24, x86_fp80 %44, x86_fp80 %43, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %46 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %24, x86_fp80 %45, x86_fp80 %42, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %47 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %24, x86_fp80 %46, x86_fp80 %41, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %48 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %24, x86_fp80 %47, x86_fp80 %40, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %49 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %24, x86_fp80 %48, x86_fp80 %39, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %50 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %24, x86_fp80 %49, x86_fp80 0xK3FFADD0DD0DD0DC13BA2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %51 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %23, x86_fp80 %50, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %52 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %23, x86_fp80 %21, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %53 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %38, x86_fp80 %51, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %54 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %52, x86_fp80 %53, x86_fp80 %20, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %55 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %23, x86_fp80 %54, x86_fp80 %20, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %56 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 0xK3FFDAAAAAAAAAAAAAAA5, x86_fp80 %52, x86_fp80 %55, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %57 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %21, x86_fp80 %56, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br i1 %6, label %58, label %73

58:                                               ; preds = %19
  %59 = mul i32 %2, -2
  %60 = or i32 %59, 1
  %61 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 %60, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %62 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 2.000000e+00, metadata !"fpexcept.ignore") #4
  %63 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %57, x86_fp80 %57, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %64 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %57, x86_fp80 %61, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %65 = tail call x86_fp80 @llvm.experimental.constrained.fdiv.f80(x86_fp80 %63, x86_fp80 %64, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %66 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %56, x86_fp80 %65, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %67 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %21, x86_fp80 %66, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %68 = fneg x86_fp80 %62
  %69 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %68, x86_fp80 %67, x86_fp80 %61, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %70 = icmp eq i32 %22, 0
  %71 = fneg x86_fp80 %69
  %72 = select i1 %70, x86_fp80 %69, x86_fp80 %71
  br label %92

73:                                               ; preds = %19
  %74 = icmp eq i32 %2, 0
  br i1 %74, label %92, label %75

75:                                               ; preds = %73
  %76 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0x41F0000000000000, metadata !"fpexcept.ignore") #4
  %77 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %57, x86_fp80 %76, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %78 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0x41F0000000000000, metadata !"fpexcept.ignore") #4
  %79 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %77, x86_fp80 %78, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %80 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %79, x86_fp80 %21, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %81 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %56, x86_fp80 %80, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %82 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double -1.000000e+00, metadata !"fpexcept.ignore") #4
  %83 = tail call x86_fp80 @llvm.experimental.constrained.fdiv.f80(x86_fp80 %82, x86_fp80 %57, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %84 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0x41F0000000000000, metadata !"fpexcept.ignore") #4
  %85 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %83, x86_fp80 %84, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %86 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0x41F0000000000000, metadata !"fpexcept.ignore") #4
  %87 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %85, x86_fp80 %86, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %88 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 1.000000e+00, metadata !"fpexcept.ignore") #4
  %89 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %87, x86_fp80 %79, x86_fp80 %88, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %90 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %87, x86_fp80 %81, x86_fp80 %89, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %91 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %83, x86_fp80 %90, x86_fp80 %87, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %92

92:                                               ; preds = %73, %75, %58
  %93 = phi x86_fp80 [ %72, %58 ], [ %91, %75 ], [ %57, %73 ]
  ret x86_fp80 %93
}

; Function Attrs: optsize
declare x86_fp80 @fabsl(x86_fp80 noundef) local_unnamed_addr #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80, x86_fp80, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80, x86_fp80, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80, x86_fp80, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80, x86_fp80, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80, x86_fp80, x86_fp80, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fdiv.f80(x86_fp80, x86_fp80, metadata, metadata) #2

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #4 = { strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
