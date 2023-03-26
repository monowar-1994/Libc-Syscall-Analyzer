; ModuleID = 'src/multibyte/wcrtomb.c'
source_filename = "src/multibyte/wcrtomb.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__mbstate_t = type { i32, i32 }
%struct.__pthread = type { %struct.__pthread*, i64*, %struct.__pthread*, %struct.__pthread*, i64, i64, i32, i32, i32, i32, i8, i8, i8, i8*, i64, i8*, i64, i64, i8*, %struct.__ptcb*, i8**, %struct.anon, i32, i32, %struct.__locale_struct*, [1 x i32], i8*, i8* }
%struct.__ptcb = type { void (i8*)*, i8*, %struct.__ptcb* }
%struct.anon = type { i8*, i64, i8* }
%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type { i8*, i64, [24 x i8], %struct.__locale_map* }

; Function Attrs: nounwind optsize strictfp
define i64 @wcrtomb(i8* noalias noundef writeonly %0, i32 noundef %1, %struct.__mbstate_t* noalias nocapture noundef readnone %2) local_unnamed_addr #0 {
  %4 = icmp eq i8* %0, null
  br i1 %4, label %75, label %5

5:                                                ; preds = %3
  %6 = icmp ult i32 %1, 128
  br i1 %6, label %7, label %9

7:                                                ; preds = %5
  %8 = trunc i32 %1 to i8
  store i8 %8, i8* %0, align 1, !tbaa !3
  br label %75

9:                                                ; preds = %5
  %10 = tail call i64 asm "mov %fs:0,$0", "=r,~{dirflag},~{fpsr},~{flags}"() #2, !srcloc !6
  %11 = inttoptr i64 %10 to %struct.__pthread*
  %12 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %11, i64 0, i32 24
  %13 = load %struct.__locale_struct*, %struct.__locale_struct** %12, align 8, !tbaa !7
  %14 = getelementptr inbounds %struct.__locale_struct, %struct.__locale_struct* %13, i64 0, i32 0, i64 0
  %15 = load %struct.__locale_map*, %struct.__locale_map** %14, align 8, !tbaa !13
  %16 = icmp eq %struct.__locale_map* %15, null
  br i1 %16, label %17, label %24

17:                                               ; preds = %9
  %18 = and i32 %1, -128
  %19 = icmp eq i32 %18, 57216
  br i1 %19, label %22, label %20

20:                                               ; preds = %17
  %21 = tail call i32* @___errno_location() #3
  store i32 84, i32* %21, align 4, !tbaa !14
  br label %75

22:                                               ; preds = %17
  %23 = trunc i32 %1 to i8
  store i8 %23, i8* %0, align 1, !tbaa !3
  br label %75

24:                                               ; preds = %9
  %25 = icmp ult i32 %1, 2048
  br i1 %25, label %26, label %34

26:                                               ; preds = %24
  %27 = lshr i32 %1, 6
  %28 = trunc i32 %27 to i8
  %29 = or i8 %28, -64
  %30 = getelementptr inbounds i8, i8* %0, i64 1
  store i8 %29, i8* %0, align 1, !tbaa !3
  %31 = trunc i32 %1 to i8
  %32 = and i8 %31, 63
  %33 = or i8 %32, -128
  store i8 %33, i8* %30, align 1, !tbaa !3
  br label %75

34:                                               ; preds = %24
  %35 = icmp ult i32 %1, 55296
  %36 = and i32 %1, -8192
  %37 = icmp eq i32 %36, 57344
  %38 = or i1 %35, %37
  br i1 %38, label %39, label %52

39:                                               ; preds = %34
  %40 = lshr i32 %1, 12
  %41 = trunc i32 %40 to i8
  %42 = or i8 %41, -32
  %43 = getelementptr inbounds i8, i8* %0, i64 1
  store i8 %42, i8* %0, align 1, !tbaa !3
  %44 = lshr i32 %1, 6
  %45 = trunc i32 %44 to i8
  %46 = and i8 %45, 63
  %47 = or i8 %46, -128
  %48 = getelementptr inbounds i8, i8* %0, i64 2
  store i8 %47, i8* %43, align 1, !tbaa !3
  %49 = trunc i32 %1 to i8
  %50 = and i8 %49, 63
  %51 = or i8 %50, -128
  store i8 %51, i8* %48, align 1, !tbaa !3
  br label %75

52:                                               ; preds = %34
  %53 = add i32 %1, -65536
  %54 = icmp ult i32 %53, 1048576
  br i1 %54, label %55, label %73

55:                                               ; preds = %52
  %56 = lshr i32 %1, 18
  %57 = trunc i32 %56 to i8
  %58 = or i8 %57, -16
  %59 = getelementptr inbounds i8, i8* %0, i64 1
  store i8 %58, i8* %0, align 1, !tbaa !3
  %60 = lshr i32 %1, 12
  %61 = trunc i32 %60 to i8
  %62 = and i8 %61, 63
  %63 = or i8 %62, -128
  %64 = getelementptr inbounds i8, i8* %0, i64 2
  store i8 %63, i8* %59, align 1, !tbaa !3
  %65 = lshr i32 %1, 6
  %66 = trunc i32 %65 to i8
  %67 = and i8 %66, 63
  %68 = or i8 %67, -128
  %69 = getelementptr inbounds i8, i8* %0, i64 3
  store i8 %68, i8* %64, align 1, !tbaa !3
  %70 = trunc i32 %1 to i8
  %71 = and i8 %70, 63
  %72 = or i8 %71, -128
  store i8 %72, i8* %69, align 1, !tbaa !3
  br label %75

73:                                               ; preds = %52
  %74 = tail call i32* @___errno_location() #3
  store i32 84, i32* %74, align 4, !tbaa !14
  br label %75

75:                                               ; preds = %3, %73, %55, %39, %26, %22, %20, %7
  %76 = phi i64 [ 1, %7 ], [ 1, %22 ], [ -1, %20 ], [ 2, %26 ], [ 3, %39 ], [ 4, %55 ], [ -1, %73 ], [ 1, %3 ]
  ret i64 %76
}

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind readnone strictfp }
attributes #3 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{i64 269303}
!7 = !{!8, !9, i64 168}
!8 = !{!"__pthread", !9, i64 0, !9, i64 8, !9, i64 16, !9, i64 24, !10, i64 32, !10, i64 40, !11, i64 48, !11, i64 52, !11, i64 56, !11, i64 60, !4, i64 64, !4, i64 65, !4, i64 66, !4, i64 66, !9, i64 72, !10, i64 80, !9, i64 88, !10, i64 96, !10, i64 104, !9, i64 112, !9, i64 120, !9, i64 128, !12, i64 136, !11, i64 160, !11, i64 164, !9, i64 168, !4, i64 176, !9, i64 184, !9, i64 192}
!9 = !{!"any pointer", !4, i64 0}
!10 = !{!"long", !4, i64 0}
!11 = !{!"int", !4, i64 0}
!12 = !{!"", !9, i64 0, !10, i64 8, !9, i64 16}
!13 = !{!9, !9, i64 0}
!14 = !{!11, !11, i64 0}
