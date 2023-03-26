; ModuleID = 'src/multibyte/mbrtowc.c'
source_filename = "src/multibyte/mbrtowc.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__mbstate_t = type { i32, i32 }
%struct.__pthread = type { %struct.__pthread*, i64*, %struct.__pthread*, %struct.__pthread*, i64, i64, i32, i32, i32, i32, i8, i8, i8, i8*, i64, i8*, i64, i64, i8*, %struct.__ptcb*, i8**, %struct.anon, i32, i32, %struct.__locale_struct*, [1 x i32], i8*, i8* }
%struct.__ptcb = type { void (i8*)*, i8*, %struct.__ptcb* }
%struct.anon = type { i8*, i64, i8* }
%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type { i8*, i64, [24 x i8], %struct.__locale_map* }

@mbrtowc.internal_state = internal unnamed_addr global i32 0, align 4
@__fsmu8 = external hidden local_unnamed_addr constant [0 x i32], align 4

; Function Attrs: nounwind optsize strictfp
define i64 @mbrtowc(i32* noalias noundef writeonly %0, i8* noalias noundef readonly %1, i64 noundef %2, %struct.__mbstate_t* noalias noundef %3) local_unnamed_addr #0 {
  %5 = alloca i32, align 4
  %6 = bitcast i32* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %6)
  %7 = icmp eq %struct.__mbstate_t* %3, null
  %8 = select i1 %7, %struct.__mbstate_t* bitcast (i32* @mbrtowc.internal_state to %struct.__mbstate_t*), %struct.__mbstate_t* %3
  %9 = getelementptr %struct.__mbstate_t, %struct.__mbstate_t* %8, i64 0, i32 0
  %10 = load i32, i32* %9, align 4, !tbaa !3
  %11 = icmp eq i8* %1, null
  br i1 %11, label %12, label %14

12:                                               ; preds = %4
  %13 = icmp eq i32 %10, 0
  br i1 %13, label %86, label %84

14:                                               ; preds = %4
  %15 = icmp eq i32* %0, null
  %16 = select i1 %15, i32* %5, i32* %0
  %17 = icmp eq i64 %2, 0
  br i1 %17, label %86, label %18

18:                                               ; preds = %14
  %19 = icmp eq i32 %10, 0
  br i1 %19, label %20, label %49

20:                                               ; preds = %18
  %21 = load i8, i8* %1, align 1, !tbaa !7
  %22 = icmp sgt i8 %21, -1
  br i1 %22, label %23, label %27

23:                                               ; preds = %20
  %24 = zext i8 %21 to i32
  store i32 %24, i32* %16, align 4, !tbaa !3
  %25 = icmp ne i8 %21, 0
  %26 = zext i1 %25 to i64
  br label %86

27:                                               ; preds = %20
  %28 = tail call i64 asm "mov %fs:0,$0", "=r,~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !8
  %29 = inttoptr i64 %28 to %struct.__pthread*
  %30 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %29, i64 0, i32 24
  %31 = load %struct.__locale_struct*, %struct.__locale_struct** %30, align 8, !tbaa !9
  %32 = getelementptr inbounds %struct.__locale_struct, %struct.__locale_struct* %31, i64 0, i32 0, i64 0
  %33 = load %struct.__locale_map*, %struct.__locale_map** %32, align 8, !tbaa !14
  %34 = icmp eq %struct.__locale_map* %33, null
  br i1 %34, label %35, label %38

35:                                               ; preds = %27
  %36 = sext i8 %21 to i32
  %37 = and i32 %36, 57343
  store i32 %37, i32* %16, align 4, !tbaa !3
  br label %86

38:                                               ; preds = %27
  %39 = zext i8 %21 to i32
  %40 = add nsw i32 %39, -194
  %41 = icmp ugt i32 %40, 50
  br i1 %41, label %84, label %42

42:                                               ; preds = %38
  %43 = getelementptr inbounds i8, i8* %1, i64 1
  %44 = zext i32 %40 to i64
  %45 = getelementptr inbounds [0 x i32], [0 x i32]* @__fsmu8, i64 0, i64 %44
  %46 = load i32, i32* %45, align 4, !tbaa !3
  %47 = add i64 %2, -1
  %48 = icmp eq i64 %47, 0
  br i1 %48, label %82, label %49

49:                                               ; preds = %18, %42
  %50 = phi i8* [ %43, %42 ], [ %1, %18 ]
  %51 = phi i32 [ %46, %42 ], [ %10, %18 ]
  %52 = phi i64 [ %47, %42 ], [ %2, %18 ]
  %53 = load i8, i8* %50, align 1, !tbaa !7
  %54 = lshr i8 %53, 3
  %55 = zext i8 %54 to i32
  %56 = add nsw i32 %55, -16
  %57 = ashr i32 %51, 26
  %58 = add nsw i32 %57, %55
  %59 = or i32 %56, %58
  %60 = icmp ult i32 %59, 8
  br i1 %60, label %61, label %84

61:                                               ; preds = %49, %78
  %62 = phi i8 [ %79, %78 ], [ %53, %49 ]
  %63 = phi i64 [ %71, %78 ], [ %52, %49 ]
  %64 = phi i32 [ %70, %78 ], [ %51, %49 ]
  %65 = phi i8* [ %67, %78 ], [ %50, %49 ]
  %66 = shl i32 %64, 6
  %67 = getelementptr inbounds i8, i8* %65, i64 1
  %68 = zext i8 %62 to i32
  %69 = add nsw i32 %68, -128
  %70 = or i32 %69, %66
  %71 = add i64 %63, -1
  %72 = icmp sgt i32 %70, -1
  br i1 %72, label %73, label %76

73:                                               ; preds = %61
  store i32 0, i32* %9, align 4, !tbaa !3
  store i32 %70, i32* %16, align 4, !tbaa !3
  %74 = and i64 %2, 4294967295
  %75 = sub i64 %74, %71
  br label %86

76:                                               ; preds = %61
  %77 = icmp eq i64 %71, 0
  br i1 %77, label %82, label %78

78:                                               ; preds = %76
  %79 = load i8, i8* %67, align 1, !tbaa !7
  %80 = and i8 %79, -64
  %81 = icmp eq i8 %80, -128
  br i1 %81, label %61, label %84

82:                                               ; preds = %76, %42
  %83 = phi i32 [ %46, %42 ], [ %70, %76 ]
  store i32 %83, i32* %9, align 4, !tbaa !3
  br label %86

84:                                               ; preds = %78, %49, %38, %12
  store i32 0, i32* %9, align 4, !tbaa !3
  %85 = tail call i32* @___errno_location() #4
  store i32 84, i32* %85, align 4, !tbaa !3
  br label %86

86:                                               ; preds = %14, %12, %84, %82, %73, %35, %23
  %87 = phi i64 [ -1, %84 ], [ -2, %82 ], [ %75, %73 ], [ %26, %23 ], [ 1, %35 ], [ 0, %12 ], [ -2, %14 ]
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %6)
  ret i64 %87
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
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!5, !5, i64 0}
!8 = !{i64 269446}
!9 = !{!10, !11, i64 168}
!10 = !{!"__pthread", !11, i64 0, !11, i64 8, !11, i64 16, !11, i64 24, !12, i64 32, !12, i64 40, !4, i64 48, !4, i64 52, !4, i64 56, !4, i64 60, !5, i64 64, !5, i64 65, !5, i64 66, !5, i64 66, !11, i64 72, !12, i64 80, !11, i64 88, !12, i64 96, !12, i64 104, !11, i64 112, !11, i64 120, !11, i64 128, !13, i64 136, !4, i64 160, !4, i64 164, !11, i64 168, !5, i64 176, !11, i64 184, !11, i64 192}
!11 = !{!"any pointer", !5, i64 0}
!12 = !{!"long", !5, i64 0}
!13 = !{!"", !11, i64 0, !12, i64 8, !11, i64 16}
!14 = !{!11, !11, i64 0}
