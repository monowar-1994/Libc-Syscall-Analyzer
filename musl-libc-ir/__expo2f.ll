; ModuleID = 'src/math/__expo2f.c'
source_filename = "src/math/__expo2f.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define hidden float @__expo2f(float noundef %0, float noundef %1) local_unnamed_addr #0 {
  %3 = tail call float @llvm.experimental.constrained.fsub.f32(float %0, float 0x40645C7780000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %4 = tail call float @expf(float noundef %3) #4
  %5 = tail call float @llvm.experimental.constrained.fmul.f32(float %1, float 0x4740000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %6 = tail call float @llvm.experimental.constrained.fmul.f32(float %4, float %5, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %7 = tail call float @llvm.experimental.constrained.fmul.f32(float %6, float 0x4740000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  ret float %7
}

; Function Attrs: optsize
declare float @expf(float noundef) local_unnamed_addr #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fsub.f32(float, float, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fmul.f32(float, float, metadata, metadata) #2

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { strictfp }
attributes #4 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
