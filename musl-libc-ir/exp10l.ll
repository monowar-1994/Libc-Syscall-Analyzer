; ModuleID = 'src/math/exp10l.c'
source_filename = "src/math/exp10l.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@exp10l.p10 = internal unnamed_addr constant [31 x x86_fp80] [x86_fp80 0xK3FCD901D7CF73AB0ACD9, x86_fp80 0xK3FD0B424DC35095CD80F, x86_fp80 0xK3FD3E12E13424BB40E13, x86_fp80 0xK3FD78CBCCC096F5088CC, x86_fp80 0xK3FDAAFEBFF0BCB24AAFF, x86_fp80 0xK3FDDDBE6FECEBDEDD5BF, x86_fp80 0xK3FE189705F4136B4A597, x86_fp80 0xK3FE4ABCC77118461CEFD, x86_fp80 0xK3FE7D6BF94D5E57A42BC, x86_fp80 0xK3FEB8637BD05AF6C69B6, x86_fp80 0xK3FEEA7C5AC471B478423, x86_fp80 0xK3FF1D1B71758E219652C, x86_fp80 0xK3FF583126E978D4FDF3B, x86_fp80 0xK3FF8A3D70A3D70A3D70A, x86_fp80 0xK3FFBCCCCCCCCCCCCCCCD, x86_fp80 0xK3FFF8000000000000000, x86_fp80 0xK4002A000000000000000, x86_fp80 0xK4005C800000000000000, x86_fp80 0xK4008FA00000000000000, x86_fp80 0xK400C9C40000000000000, x86_fp80 0xK400FC350000000000000, x86_fp80 0xK4012F424000000000000, x86_fp80 0xK40169896800000000000, x86_fp80 0xK4019BEBC200000000000, x86_fp80 0xK401CEE6B280000000000, x86_fp80 0xK40209502F90000000000, x86_fp80 0xK4023BA43B74000000000, x86_fp80 0xK4026E8D4A51000000000, x86_fp80 0xK402A9184E72A00000000, x86_fp80 0xK402DB5E620F480000000, x86_fp80 0xK4030E35FA931A0000000], align 16

@pow10l = weak alias x86_fp80 (x86_fp80), x86_fp80 (x86_fp80)* @exp10l

; Function Attrs: nounwind optsize strictfp
define x86_fp80 @exp10l(x86_fp80 noundef %0) #0 {
  %2 = alloca x86_fp80, align 16
  %3 = bitcast x86_fp80* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %3) #4
  %4 = call x86_fp80 @modfl(x86_fp80 noundef %0, x86_fp80* noundef nonnull %2) #5
  %5 = load x86_fp80, x86_fp80* %2, align 16, !tbaa !3
  %6 = bitcast x86_fp80 %5 to i80
  %7 = and i80 %6, 604444463063240877801472
  %8 = icmp ult i80 %7, 302286795135878422331392
  br i1 %8, label %9, label %27

9:                                                ; preds = %1
  %10 = call i1 @llvm.experimental.constrained.fcmp.f80(x86_fp80 %4, x86_fp80 0xK00000000000000000000, metadata !"une", metadata !"fpexcept.ignore") #6
  br i1 %10, label %17, label %11

11:                                               ; preds = %9
  %12 = call i32 @llvm.experimental.constrained.fptosi.i32.f80(x86_fp80 %5, metadata !"fpexcept.ignore") #6
  %13 = add nsw i32 %12, 15
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [31 x x86_fp80], [31 x x86_fp80]* @exp10l.p10, i64 0, i64 %14
  %16 = load x86_fp80, x86_fp80* %15, align 16, !tbaa !3
  br label %30

17:                                               ; preds = %9
  %18 = call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 0xK4000D49A784BCD1B8AFE, x86_fp80 %4, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %19 = call x86_fp80 @exp2l(x86_fp80 noundef %18) #5
  %20 = load x86_fp80, x86_fp80* %2, align 16, !tbaa !3
  %21 = call i32 @llvm.experimental.constrained.fptosi.i32.f80(x86_fp80 %20, metadata !"fpexcept.ignore") #6
  %22 = add nsw i32 %21, 15
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [31 x x86_fp80], [31 x x86_fp80]* @exp10l.p10, i64 0, i64 %23
  %25 = load x86_fp80, x86_fp80* %24, align 16, !tbaa !3
  %26 = call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %19, x86_fp80 %25, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  br label %30

27:                                               ; preds = %1
  %28 = call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 1.000000e+01, metadata !"fpexcept.ignore") #6
  %29 = call x86_fp80 @powl(x86_fp80 noundef %28, x86_fp80 noundef %0) #5
  br label %30

30:                                               ; preds = %27, %17, %11
  %31 = phi x86_fp80 [ %26, %17 ], [ %16, %11 ], [ %29, %27 ]
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %3) #4
  ret x86_fp80 %31
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare x86_fp80 @modfl(x86_fp80 noundef, x86_fp80* noundef) local_unnamed_addr #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmp.f80(x86_fp80, x86_fp80, metadata, metadata) #3

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i32 @llvm.experimental.constrained.fptosi.i32.f80(x86_fp80, metadata) #3

; Function Attrs: optsize
declare x86_fp80 @exp2l(x86_fp80 noundef) local_unnamed_addr #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80, x86_fp80, metadata, metadata) #3

; Function Attrs: optsize
declare x86_fp80 @powl(x86_fp80 noundef, x86_fp80 noundef) local_unnamed_addr #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double, metadata) #3

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #4 = { nounwind strictfp }
attributes #5 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #6 = { strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"long double", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
