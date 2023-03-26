; ModuleID = 'src/env/__libc_start_main.c'
source_filename = "src/env/__libc_start_main.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__libc = type { i8, i8, i8, i8, i32, i64*, %struct.tls_module*, i64, i64, i64, i64, %struct.__locale_struct }
%struct.tls_module = type { %struct.tls_module*, i8*, i64, i64, i64, i64 }
%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type opaque
%struct.pollfd = type { i32, i16, i16 }

@__environ = external local_unnamed_addr global i8**, align 8
@__libc = external hidden local_unnamed_addr global %struct.__libc, align 8
@__hwcap = external hidden local_unnamed_addr global i64, align 8
@__sysinfo = external hidden local_unnamed_addr global i64, align 8
@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@__progname_full = external local_unnamed_addr global i8*, align 8
@__progname = external local_unnamed_addr global i8*, align 8
@__const.__init_libc.pfd = private unnamed_addr constant [3 x %struct.pollfd] [%struct.pollfd zeroinitializer, %struct.pollfd { i32 1, i16 0, i16 0 }, %struct.pollfd { i32 2, i16 0, i16 0 }], align 16
@.str.1 = private unnamed_addr constant [10 x i8] c"/dev/null\00", align 1
@__init_array_start = extern_weak hidden constant void ()*, align 8
@__init_array_end = extern_weak hidden constant void ()*, align 8

@_init = weak alias void (), void ()* @dummy
@__init_ssp = weak hidden alias void (i8*), void (i8*)* @dummy1
@__libc_start_init = weak hidden alias void (), void ()* @libc_start_init

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn
define internal void @dummy() #0 {
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn
define internal void @dummy1(i8* nocapture noundef %0) #0 {
  ret void
}

; Function Attrs: noinline nounwind optsize strictfp
define hidden void @__init_libc(i8** noundef %0, i8* noundef %1) local_unnamed_addr #1 {
  %3 = alloca [38 x i64], align 16
  %4 = alloca [3 x %struct.pollfd], align 16
  %5 = bitcast [38 x i64]* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 304, i8* nonnull %5) #9
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(304) %5, i8 0, i64 304, i1 false) #10
  store i8** %0, i8*** @__environ, align 8, !tbaa !3
  br label %6

6:                                                ; preds = %6, %2
  %7 = phi i64 [ 0, %2 ], [ %11, %6 ]
  %8 = getelementptr inbounds i8*, i8** %0, i64 %7
  %9 = load i8*, i8** %8, align 8, !tbaa !3
  %10 = icmp eq i8* %9, null
  %11 = add i64 %7, 1
  br i1 %10, label %12, label %6

12:                                               ; preds = %6
  %13 = getelementptr inbounds i8*, i8** %0, i64 %7
  %14 = getelementptr inbounds i8*, i8** %13, i64 1
  store i8** %14, i8*** bitcast (i64** getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 5) to i8***), align 8, !tbaa !7
  %15 = bitcast i8** %14 to i64*
  %16 = load i64, i64* %15, align 8, !tbaa !12
  %17 = icmp eq i64 %16, 0
  br i1 %17, label %18, label %19

18:                                               ; preds = %12
  store i64 0, i64* @__hwcap, align 8, !tbaa !12
  br label %42

19:                                               ; preds = %12, %29
  %20 = phi i64 [ %33, %29 ], [ %16, %12 ]
  %21 = phi i64 [ %30, %29 ], [ 0, %12 ]
  %22 = icmp ult i64 %20, 38
  br i1 %22, label %23, label %29

23:                                               ; preds = %19
  %24 = or i64 %21, 1
  %25 = getelementptr inbounds i8*, i8** %14, i64 %24
  %26 = bitcast i8** %25 to i64*
  %27 = load i64, i64* %26, align 8, !tbaa !12
  %28 = getelementptr inbounds [38 x i64], [38 x i64]* %3, i64 0, i64 %20
  store i64 %27, i64* %28, align 8, !tbaa !12
  br label %29

29:                                               ; preds = %19, %23
  %30 = add i64 %21, 2
  %31 = getelementptr inbounds i8*, i8** %14, i64 %30
  %32 = bitcast i8** %31 to i64*
  %33 = load i64, i64* %32, align 8, !tbaa !12
  %34 = icmp eq i64 %33, 0
  br i1 %34, label %35, label %19

35:                                               ; preds = %29
  %36 = getelementptr inbounds [38 x i64], [38 x i64]* %3, i64 0, i64 16
  %37 = load i64, i64* %36, align 16, !tbaa !12
  %38 = getelementptr inbounds [38 x i64], [38 x i64]* %3, i64 0, i64 32
  %39 = load i64, i64* %38, align 16, !tbaa !12
  store i64 %37, i64* @__hwcap, align 8, !tbaa !12
  %40 = icmp eq i64 %39, 0
  br i1 %40, label %42, label %41

41:                                               ; preds = %35
  store i64 %39, i64* @__sysinfo, align 8, !tbaa !12
  br label %42

42:                                               ; preds = %18, %41, %35
  %43 = getelementptr inbounds [38 x i64], [38 x i64]* %3, i64 0, i64 6
  %44 = load i64, i64* %43, align 16, !tbaa !12
  store i64 %44, i64* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 10), align 8, !tbaa !13
  %45 = icmp eq i8* %1, null
  %46 = getelementptr inbounds [38 x i64], [38 x i64]* %3, i64 0, i64 31
  %47 = load i64, i64* %46, align 8
  %48 = inttoptr i64 %47 to i8*
  %49 = select i1 %45, i8* %48, i8* %1
  %50 = icmp eq i8* %49, null
  %51 = select i1 %50, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i64 0, i64 0), i8* %49
  store i8* %51, i8** @__progname_full, align 8, !tbaa !3
  store i8* %51, i8** @__progname, align 8, !tbaa !3
  br label %52

52:                                               ; preds = %58, %42
  %53 = phi i64 [ 0, %42 ], [ %59, %58 ]
  %54 = getelementptr inbounds i8, i8* %51, i64 %53
  %55 = load i8, i8* %54, align 1, !tbaa !14
  switch i8 %55, label %58 [
    i8 0, label %60
    i8 47, label %56
  ]

56:                                               ; preds = %52
  %57 = getelementptr inbounds i8, i8* %54, i64 1
  store i8* %57, i8** @__progname, align 8, !tbaa !3
  br label %58

58:                                               ; preds = %52, %56
  %59 = add i64 %53, 1
  br label %52

60:                                               ; preds = %52
  %61 = getelementptr inbounds [38 x i64], [38 x i64]* %3, i64 0, i64 0
  call void @__init_tls(i64* noundef nonnull %61) #11
  %62 = getelementptr inbounds [38 x i64], [38 x i64]* %3, i64 0, i64 25
  %63 = load i64, i64* %62, align 8, !tbaa !12
  %64 = inttoptr i64 %63 to i8*
  call void @__init_ssp(i8* noundef %64) #11
  %65 = getelementptr inbounds [38 x i64], [38 x i64]* %3, i64 0, i64 11
  %66 = load i64, i64* %65, align 8, !tbaa !12
  %67 = getelementptr inbounds [38 x i64], [38 x i64]* %3, i64 0, i64 12
  %68 = load i64, i64* %67, align 16, !tbaa !12
  %69 = icmp eq i64 %66, %68
  br i1 %69, label %70, label %80

70:                                               ; preds = %60
  %71 = getelementptr inbounds [38 x i64], [38 x i64]* %3, i64 0, i64 13
  %72 = load i64, i64* %71, align 8, !tbaa !12
  %73 = getelementptr inbounds [38 x i64], [38 x i64]* %3, i64 0, i64 14
  %74 = load i64, i64* %73, align 16, !tbaa !12
  %75 = icmp ne i64 %72, %74
  %76 = getelementptr inbounds [38 x i64], [38 x i64]* %3, i64 0, i64 23
  %77 = load i64, i64* %76, align 8
  %78 = icmp ne i64 %77, 0
  %79 = select i1 %75, i1 true, i1 %78
  br i1 %79, label %80, label %102

80:                                               ; preds = %70, %60
  %81 = bitcast [3 x %struct.pollfd]* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %81) #9
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(24) %81, i8* noundef nonnull align 16 dereferenceable(24) bitcast ([3 x %struct.pollfd]* @__const.__init_libc.pfd to i8*), i64 24, i1 false) #10
  %82 = ptrtoint [3 x %struct.pollfd]* %4 to i64
  %83 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 7, i64 %82, i64 3, i64 0) #9, !srcloc !15
  %84 = and i64 %83, 2147483648
  %85 = icmp eq i64 %84, 0
  br i1 %85, label %87, label %86

86:                                               ; preds = %80
  call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #9, !srcloc !16
  br label %87

87:                                               ; preds = %86, %80
  br label %88

88:                                               ; preds = %87, %98
  %89 = phi i64 [ %99, %98 ], [ 0, %87 ]
  %90 = getelementptr inbounds [3 x %struct.pollfd], [3 x %struct.pollfd]* %4, i64 0, i64 %89, i32 2
  %91 = load i16, i16* %90, align 2, !tbaa !17
  %92 = and i16 %91, 32
  %93 = icmp eq i16 %92, 0
  br i1 %93, label %98, label %94

94:                                               ; preds = %88
  %95 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 2, i64 ptrtoint ([10 x i8]* @.str.1 to i64), i64 32770) #9, !srcloc !20
  %96 = icmp slt i64 %95, 0
  br i1 %96, label %97, label %98

97:                                               ; preds = %94
  call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #9, !srcloc !16
  br label %98

98:                                               ; preds = %88, %97, %94
  %99 = add nuw nsw i64 %89, 1
  %100 = icmp eq i64 %99, 3
  br i1 %100, label %101, label %88

101:                                              ; preds = %98
  store i8 1, i8* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 2), align 2, !tbaa !21
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %81) #9
  br label %102

102:                                              ; preds = %70, %101
  call void @llvm.lifetime.end.p0i8(i64 304, i8* nonnull %5) #9
  ret void
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: optsize
declare hidden void @__init_tls(i64* noundef) local_unnamed_addr #4

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind optsize strictfp
define internal void @libc_start_init() #6 {
  tail call void @_init() #11
  br i1 icmp ult (void ()** @__init_array_start, void ()** @__init_array_end), label %1, label %7

1:                                                ; preds = %0, %1
  %2 = phi i64 [ %5, %1 ], [ ptrtoint (void ()** @__init_array_start to i64), %0 ]
  %3 = inttoptr i64 %2 to void ()**
  %4 = load void ()*, void ()** %3, align 8, !tbaa !3
  tail call void %4() #11
  %5 = add i64 %2, 8
  %6 = icmp ult i64 %5, ptrtoint (void ()** @__init_array_end to i64)
  br i1 %6, label %1, label %7

7:                                                ; preds = %1, %0
  ret void
}

; Function Attrs: nounwind optsize strictfp
define i32 @__libc_start_main(i32 (i32, i8**, i8**)* noundef %0, i32 noundef %1, i8** noundef %2, void (...)* nocapture noundef readnone %3, void (...)* nocapture noundef readnone %4, void (...)* nocapture noundef readnone %5) local_unnamed_addr #6 {
  %7 = sext i32 %1 to i64
  %8 = getelementptr inbounds i8*, i8** %2, i64 %7
  %9 = getelementptr inbounds i8*, i8** %8, i64 1
  %10 = load i8*, i8** %2, align 8, !tbaa !3
  tail call void @__init_libc(i8** noundef nonnull %9, i8* noundef %10) #12
  %11 = tail call i32 (i32 (i32, i8**, i8**)*, i32, i8**)* asm "", "=r,0,~{memory},~{dirflag},~{fpsr},~{flags}"(i32 (i32 (i32, i8**, i8**)*, i32, i8**)* nonnull @libc_start_main_stage2) #9, !srcloc !22
  %12 = tail call i32 %11(i32 (i32, i8**, i8**)* noundef %0, i32 noundef %1, i8** noundef nonnull %2) #11
  ret i32 %12
}

; Function Attrs: noreturn nounwind optsize strictfp
define internal i32 @libc_start_main_stage2(i32 (i32, i8**, i8**)* nocapture noundef readonly %0, i32 noundef %1, i8** noundef %2) #7 {
  %4 = sext i32 %1 to i64
  %5 = getelementptr inbounds i8*, i8** %2, i64 %4
  %6 = getelementptr inbounds i8*, i8** %5, i64 1
  tail call void @__libc_start_init() #11
  %7 = tail call i32 %0(i32 noundef %1, i8** noundef %2, i8** noundef nonnull %6) #11
  tail call void @exit(i32 noundef %7) #13
  unreachable
}

; Function Attrs: noreturn optsize
declare void @exit(i32 noundef) local_unnamed_addr #8

attributes #0 = { mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { noinline nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #4 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly mustprogress nofree nounwind willreturn }
attributes #6 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { noreturn nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { noreturn optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { nounwind strictfp }
attributes #10 = { strictfp }
attributes #11 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #12 = { nobuiltin optsize strictfp "no-builtins" }
attributes #13 = { nobuiltin noreturn nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !4, i64 8}
!8 = !{!"__libc", !5, i64 0, !5, i64 1, !5, i64 2, !5, i64 3, !9, i64 4, !4, i64 8, !4, i64 16, !10, i64 24, !10, i64 32, !10, i64 40, !10, i64 48, !11, i64 56}
!9 = !{!"int", !5, i64 0}
!10 = !{!"long", !5, i64 0}
!11 = !{!"__locale_struct", !5, i64 0}
!12 = !{!10, !10, i64 0}
!13 = !{!8, !10, i64 48}
!14 = !{!5, !5, i64 0}
!15 = !{i64 213756}
!16 = !{i64 228271}
!17 = !{!18, !19, i64 6}
!18 = !{!"pollfd", !9, i64 0, !19, i64 4, !19, i64 6}
!19 = !{!"short", !5, i64 0}
!20 = !{i64 213544}
!21 = !{!8, !5, i64 2}
!22 = !{i64 2339}
