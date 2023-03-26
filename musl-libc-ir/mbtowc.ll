; ModuleID = 'src/multibyte/mbtowc.c'
source_filename = "src/multibyte/mbtowc.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__pthread = type { %struct.__pthread*, i64*, %struct.__pthread*, %struct.__pthread*, i64, i64, i32, i32, i32, i32, i8, i8, i8, i8*, i64, i8*, i64, i64, i8*, %struct.__ptcb*, i8**, %struct.anon, i32, i32, %struct.__locale_struct*, [1 x i32], i8*, i8* }
%struct.__ptcb = type { void (i8*)*, i8*, %struct.__ptcb* }
%struct.anon = type { i8*, i64, i8* }
%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type { i8*, i64, [24 x i8], %struct.__locale_map* }

@__fsmu8 = external hidden local_unnamed_addr constant [0 x i32], align 4

; Function Attrs: nounwind optsize strictfp
define i32 @mbtowc(i32* noalias noundef writeonly %0, i8* noalias noundef readonly %1, i64 noundef %2) local_unnamed_addr #0 {
  %4 = alloca i32, align 4
  %5 = bitcast i32* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %5)
  %6 = icmp eq i8* %1, null
  br i1 %6, label %82, label %7

7:                                                ; preds = %3
  %8 = icmp eq i64 %2, 0
  br i1 %8, label %80, label %9

9:                                                ; preds = %7
  %10 = icmp eq i32* %0, null
  %11 = select i1 %10, i32* %4, i32* %0
  %12 = load i8, i8* %1, align 1, !tbaa !3
  %13 = icmp sgt i8 %12, -1
  br i1 %13, label %14, label %18

14:                                               ; preds = %9
  %15 = zext i8 %12 to i32
  store i32 %15, i32* %11, align 4, !tbaa !6
  %16 = icmp ne i8 %12, 0
  %17 = zext i1 %16 to i32
  br label %82

18:                                               ; preds = %9
  %19 = tail call i64 asm "mov %fs:0,$0", "=r,~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !8
  %20 = inttoptr i64 %19 to %struct.__pthread*
  %21 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %20, i64 0, i32 24
  %22 = load %struct.__locale_struct*, %struct.__locale_struct** %21, align 8, !tbaa !9
  %23 = getelementptr inbounds %struct.__locale_struct, %struct.__locale_struct* %22, i64 0, i32 0, i64 0
  %24 = load %struct.__locale_map*, %struct.__locale_map** %23, align 8, !tbaa !14
  %25 = icmp eq %struct.__locale_map* %24, null
  br i1 %25, label %26, label %29

26:                                               ; preds = %18
  %27 = sext i8 %12 to i32
  %28 = and i32 %27, 57343
  store i32 %28, i32* %11, align 4, !tbaa !6
  br label %82

29:                                               ; preds = %18
  %30 = zext i8 %12 to i32
  %31 = add nsw i32 %30, -194
  %32 = icmp ugt i32 %31, 50
  br i1 %32, label %80, label %33

33:                                               ; preds = %29
  %34 = getelementptr inbounds i8, i8* %1, i64 1
  %35 = zext i32 %31 to i64
  %36 = getelementptr inbounds [0 x i32], [0 x i32]* @__fsmu8, i64 0, i64 %35
  %37 = load i32, i32* %36, align 4, !tbaa !6
  %38 = icmp ult i64 %2, 4
  br i1 %38, label %39, label %45

39:                                               ; preds = %33
  %40 = trunc i64 %2 to i32
  %41 = mul nuw nsw i32 %40, 6
  %42 = add nsw i32 %41, -6
  %43 = shl i32 %37, %42
  %44 = icmp sgt i32 %43, -1
  br i1 %44, label %45, label %80

45:                                               ; preds = %39, %33
  %46 = load i8, i8* %34, align 1, !tbaa !3
  %47 = zext i8 %46 to i32
  %48 = lshr i32 %47, 3
  %49 = add nsw i32 %48, -16
  %50 = ashr i32 %37, 26
  %51 = add nsw i32 %48, %50
  %52 = or i32 %49, %51
  %53 = icmp ult i32 %52, 8
  br i1 %53, label %54, label %80

54:                                               ; preds = %45
  %55 = shl i32 %37, 6
  %56 = add nsw i32 %47, -128
  %57 = or i32 %56, %55
  %58 = icmp sgt i32 %57, -1
  br i1 %58, label %59, label %60

59:                                               ; preds = %54
  store i32 %57, i32* %11, align 4, !tbaa !6
  br label %82

60:                                               ; preds = %54
  %61 = getelementptr inbounds i8, i8* %1, i64 2
  %62 = load i8, i8* %61, align 1, !tbaa !3
  %63 = zext i8 %62 to i32
  %64 = add nsw i32 %63, -128
  %65 = icmp ugt i32 %64, 63
  br i1 %65, label %80, label %66

66:                                               ; preds = %60
  %67 = shl i32 %57, 6
  %68 = or i32 %64, %67
  %69 = icmp sgt i32 %68, -1
  br i1 %69, label %70, label %71

70:                                               ; preds = %66
  store i32 %68, i32* %11, align 4, !tbaa !6
  br label %82

71:                                               ; preds = %66
  %72 = getelementptr inbounds i8, i8* %1, i64 3
  %73 = load i8, i8* %72, align 1, !tbaa !3
  %74 = zext i8 %73 to i32
  %75 = add nsw i32 %74, -128
  %76 = icmp ugt i32 %75, 63
  br i1 %76, label %80, label %77

77:                                               ; preds = %71
  %78 = shl i32 %68, 6
  %79 = or i32 %75, %78
  store i32 %79, i32* %11, align 4, !tbaa !6
  br label %82

80:                                               ; preds = %71, %60, %45, %39, %29, %7
  %81 = tail call i32* @___errno_location() #4
  store i32 84, i32* %81, align 4, !tbaa !6
  br label %82

82:                                               ; preds = %3, %80, %77, %70, %59, %26, %14
  %83 = phi i32 [ %17, %14 ], [ 1, %26 ], [ -1, %80 ], [ 4, %77 ], [ 3, %70 ], [ 2, %59 ], [ 0, %3 ]
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %5)
  ret i32 %83
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readnone strictfp }
attributes #4 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!7, !7, i64 0}
!7 = !{!"int", !4, i64 0}
!8 = !{i64 269463}
!9 = !{!10, !11, i64 168}
!10 = !{!"__pthread", !11, i64 0, !11, i64 8, !11, i64 16, !11, i64 24, !12, i64 32, !12, i64 40, !7, i64 48, !7, i64 52, !7, i64 56, !7, i64 60, !4, i64 64, !4, i64 65, !4, i64 66, !4, i64 66, !11, i64 72, !12, i64 80, !11, i64 88, !12, i64 96, !12, i64 104, !11, i64 112, !11, i64 120, !11, i64 128, !13, i64 136, !7, i64 160, !7, i64 164, !11, i64 168, !4, i64 176, !11, i64 184, !11, i64 192}
!11 = !{!"any pointer", !4, i64 0}
!12 = !{!"long", !4, i64 0}
!13 = !{!"", !11, i64 0, !12, i64 8, !11, i64 16}
!14 = !{!11, !11, i64 0}
