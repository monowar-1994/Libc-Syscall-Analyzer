; ModuleID = 'src/prng/drand48.c'
source_filename = "src/prng/drand48.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@__seed48 = external hidden global [7 x i16], align 2

; Function Attrs: nounwind optsize strictfp
define double @erand48(i16* noundef %0) local_unnamed_addr #0 {
  %2 = tail call i64 @__rand48_step(i16* noundef %0, i16* noundef getelementptr inbounds ([7 x i16], [7 x i16]* @__seed48, i64 0, i64 3)) #3
  %3 = shl i64 %2, 4
  %4 = or i64 %3, 4607182418800017408
  %5 = bitcast i64 %4 to double
  %6 = tail call double @llvm.experimental.constrained.fsub.f64(double %5, double 1.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  ret double %6
}

; Function Attrs: optsize
declare hidden i64 @__rand48_step(i16* noundef, i16* noundef) local_unnamed_addr #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fsub.f64(double, double, metadata, metadata) #2

; Function Attrs: nounwind optsize strictfp
define double @drand48() local_unnamed_addr #0 {
  %1 = tail call i64 @__rand48_step(i16* noundef getelementptr inbounds ([7 x i16], [7 x i16]* @__seed48, i64 0, i64 0), i16* noundef getelementptr inbounds ([7 x i16], [7 x i16]* @__seed48, i64 0, i64 3)) #3
  %2 = shl i64 %1, 4
  %3 = or i64 %2, 4607182418800017408
  %4 = bitcast i64 %3 to double
  %5 = tail call double @llvm.experimental.constrained.fsub.f64(double %4, double 1.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  ret double %5
}

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #4 = { strictfp }
attributes #5 = { nounwind strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
