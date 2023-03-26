; ModuleID = 'src/conf/sysconf.c'
source_filename = "src/conf/sysconf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.rlimit = type { i64, i64 }
%struct.sysinfo = type { i64, [3 x i64], i64, i64, i64, i64, i64, i64, i16, i16, i64, i64, i32, [256 x i8] }

@sysconf.values = internal unnamed_addr constant [249 x i16] [i16 -254, i16 -32762, i16 100, i16 32, i16 -32761, i16 -1, i16 6, i16 1, i16 1, i16 -255, i16 -1, i16 -255, i16 -255, i16 -1, i16 -1, i16 -255, i16 -255, i16 -255, i16 -255, i16 -255, i16 -255, i16 -255, i16 -255, i16 -1, i16 -1, i16 -246, i16 -245, i16 -1, i16 -253, i16 -255, i16 -252, i16 30, i16 256, i16 -251, i16 -1, i16 -1, i16 99, i16 2048, i16 99, i16 1000, i16 2, i16 0, i16 -1, i16 -1, i16 255, i16 0, i16 -255, i16 -255, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 1024, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 -255, i16 -255, i16 -1, i16 -1, i16 256, i16 32, i16 4, i16 128, i16 2048, i16 -1, i16 -255, i16 -255, i16 -255, i16 -1, i16 -1, i16 -255, i16 -250, i16 -249, i16 -248, i16 -247, i16 -1, i16 -1, i16 700, i16 700, i16 1, i16 -1, i16 1, i16 1, i16 -1, i16 0, i16 -1, i16 -1, i16 -1, i16 -1, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 20, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 -1, i16 -1, i16 1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -255, i16 -255, i16 0, i16 0, i16 0, i16 -255, i16 -255, i16 -255, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 -255, i16 0, i16 0, i16 0, i16 -255, i16 -255, i16 1, i16 0, i16 1, i16 0, i16 -255, i16 -1, i16 -1, i16 0, i16 0, i16 -255, i16 -1, i16 0, i16 0, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 40, i16 -246, i16 -1, i16 -1, i16 -1, i16 1, i16 -1, i16 255, i16 -1, i16 -1, i16 -1, i16 -1, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 -255, i16 -255, i16 -1, i16 -1, i16 1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -246, i16 -1, i16 -1], align 16

; Function Attrs: nounwind optsize strictfp
define i64 @sysconf(i32 noundef %0) local_unnamed_addr #0 {
  %2 = alloca %struct.rlimit, align 8
  %3 = alloca [128 x i8], align 16
  %4 = alloca %struct.sysinfo, align 8
  %5 = icmp ugt i32 %0, 248
  br i1 %5, label %11, label %6

6:                                                ; preds = %1
  %7 = zext i32 %0 to i64
  %8 = getelementptr inbounds [249 x i16], [249 x i16]* @sysconf.values, i64 0, i64 %7
  %9 = load i16, i16* %8, align 2, !tbaa !3
  %10 = icmp eq i16 %9, 0
  br i1 %10, label %11, label %13

11:                                               ; preds = %6, %1
  %12 = tail call i32* @___errno_location() #5
  store i32 22, i32* %12, align 4, !tbaa !7
  br label %83

13:                                               ; preds = %6
  %14 = icmp sgt i16 %9, -2
  br i1 %14, label %15, label %17

15:                                               ; preds = %13
  %16 = sext i16 %9 to i64
  br label %83

17:                                               ; preds = %13
  switch i32 %0, label %29 [
    i32 4, label %18
    i32 1, label %18
  ]

18:                                               ; preds = %17, %17
  %19 = bitcast %struct.rlimit* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %19) #6
  %20 = and i16 %9, 16383
  %21 = zext i16 %20 to i32
  %22 = call i32 @getrlimit(i32 noundef %21, %struct.rlimit* noundef nonnull %2) #7
  %23 = getelementptr inbounds %struct.rlimit, %struct.rlimit* %2, i64 0, i32 0
  %24 = load i64, i64* %23, align 8, !tbaa !9
  %25 = icmp eq i64 %24, -1
  %26 = icmp ult i64 %24, 9223372036854775807
  %27 = select i1 %26, i64 %24, i64 9223372036854775807
  %28 = select i1 %25, i64 -1, i64 %27
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %19) #6
  br label %83

29:                                               ; preds = %17
  %30 = trunc i16 %9 to i8
  switch i8 %30, label %81 [
    i8 1, label %83
    i8 2, label %31
    i8 3, label %32
    i8 4, label %33
    i8 5, label %34
    i8 11, label %35
    i8 6, label %36
    i8 7, label %36
    i8 8, label %60
    i8 9, label %60
    i8 10, label %80
  ]

31:                                               ; preds = %29
  br label %83

32:                                               ; preds = %29
  br label %83

33:                                               ; preds = %29
  br label %83

34:                                               ; preds = %29
  br label %83

35:                                               ; preds = %29
  br label %83

36:                                               ; preds = %29, %29
  %37 = getelementptr inbounds [128 x i8], [128 x i8]* %3, i64 0, i64 0
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(128) %37, i8 0, i64 128, i1 false) #8
  store i8 1, i8* %37, align 16
  %38 = ptrtoint [128 x i8]* %3 to i64
  %39 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 204, i64 0, i64 128, i64 %38) #6, !srcloc !12
  br label %40

40:                                               ; preds = %36, %54
  %41 = phi i64 [ 0, %36 ], [ %56, %54 ]
  %42 = phi i32 [ 0, %36 ], [ %55, %54 ]
  %43 = getelementptr inbounds [128 x i8], [128 x i8]* %3, i64 0, i64 %41
  %44 = load i8, i8* %43, align 1, !tbaa !13
  %45 = icmp eq i8 %44, 0
  br i1 %45, label %54, label %46

46:                                               ; preds = %40, %46
  %47 = phi i32 [ %51, %46 ], [ %42, %40 ]
  %48 = phi i8 [ %50, %46 ], [ %44, %40 ]
  %49 = add i8 %48, -1
  %50 = and i8 %49, %48
  %51 = add nsw i32 %47, 1
  %52 = icmp eq i8 %50, 0
  br i1 %52, label %53, label %46

53:                                               ; preds = %46
  store i8 0, i8* %43, align 1, !tbaa !13
  br label %54

54:                                               ; preds = %53, %40
  %55 = phi i32 [ %51, %53 ], [ %42, %40 ]
  %56 = add nuw nsw i64 %41, 1
  %57 = icmp eq i64 %56, 128
  br i1 %57, label %58, label %40

58:                                               ; preds = %54
  %59 = sext i32 %55 to i64
  br label %83

60:                                               ; preds = %29, %29
  %61 = call i32 @__lsysinfo(%struct.sysinfo* noundef nonnull %4) #7
  %62 = getelementptr inbounds %struct.sysinfo, %struct.sysinfo* %4, i64 0, i32 12
  %63 = load i32, i32* %62, align 8, !tbaa !14
  %64 = icmp eq i32 %63, 0
  br i1 %64, label %65, label %66

65:                                               ; preds = %60
  store i32 1, i32* %62, align 8, !tbaa !14
  br label %66

66:                                               ; preds = %65, %60
  %67 = phi i32 [ 1, %65 ], [ %63, %60 ]
  %68 = icmp eq i32 %0, 85
  %69 = getelementptr inbounds %struct.sysinfo, %struct.sysinfo* %4, i64 0, i32 2
  %70 = load i64, i64* %69, align 8
  %71 = getelementptr inbounds %struct.sysinfo, %struct.sysinfo* %4, i64 0, i32 3
  %72 = load i64, i64* %71, align 8
  %73 = getelementptr inbounds %struct.sysinfo, %struct.sysinfo* %4, i64 0, i32 5
  %74 = load i64, i64* %73, align 8
  %75 = add i64 %74, %72
  %76 = select i1 %68, i64 %70, i64 %75
  %77 = zext i32 %67 to i64
  %78 = mul i64 %76, %77
  %79 = lshr i64 %78, 12
  br label %83

80:                                               ; preds = %29
  br label %83

81:                                               ; preds = %29
  %82 = sext i16 %9 to i64
  br label %83

83:                                               ; preds = %29, %81, %80, %66, %58, %35, %34, %33, %32, %31, %18, %15, %11
  %84 = phi i64 [ -1, %11 ], [ %16, %15 ], [ %28, %18 ], [ %82, %81 ], [ 0, %80 ], [ %79, %66 ], [ %59, %58 ], [ 2147483647, %35 ], [ 2147483647, %34 ], [ 4096, %33 ], [ 32768, %32 ], [ 131072, %31 ], [ 200809, %29 ]
  ret i64 %84
}

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #1

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: optsize
declare i32 @getrlimit(i32 noundef, %struct.rlimit* noundef) local_unnamed_addr #3

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: optsize
declare hidden i32 @__lsysinfo(%struct.sysinfo* noundef) local_unnamed_addr #3

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #5 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }
attributes #6 = { nounwind strictfp }
attributes #7 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #8 = { strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"short", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !5, i64 0}
!9 = !{!10, !11, i64 0}
!10 = !{!"rlimit", !11, i64 0, !11, i64 8}
!11 = !{!"long long", !5, i64 0}
!12 = !{i64 149834}
!13 = !{!5, !5, i64 0}
!14 = !{!15, !8, i64 104}
!15 = !{!"sysinfo", !16, i64 0, !5, i64 8, !16, i64 32, !16, i64 40, !16, i64 48, !16, i64 56, !16, i64 64, !16, i64 72, !4, i64 80, !4, i64 82, !16, i64 88, !16, i64 96, !8, i64 104, !5, i64 108}
!16 = !{!"long", !5, i64 0}
