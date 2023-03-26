; ModuleID = 'src/stat/statvfs.c'
source_filename = "src/stat/statvfs.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.statfs = type { i64, i64, i64, i64, i64, i64, i64, %struct.__fsid_t, i64, i64, i64, [4 x i64] }
%struct.__fsid_t = type { [2 x i32] }
%struct.statvfs = type { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, [6 x i32] }

@statfs = weak alias i32 (i8*, %struct.statfs*), i32 (i8*, %struct.statfs*)* @__statfs
@fstatfs = weak alias i32 (i32, %struct.statfs*), i32 (i32, %struct.statfs*)* @__fstatfs
@statvfs64 = weak alias i32 (i8*, %struct.statvfs*), i32 (i8*, %struct.statvfs*)* @statvfs
@statfs64 = weak alias i32 (i8*, %struct.statfs*), i32 (i8*, %struct.statfs*)* @__statfs
@fstatvfs64 = weak alias i32 (i32, %struct.statvfs*), i32 (i32, %struct.statvfs*)* @fstatvfs
@fstatfs64 = weak alias i32 (i32, %struct.statfs*), i32 (i32, %struct.statfs*)* @__fstatfs

; Function Attrs: nounwind optsize strictfp
define internal i32 @__statfs(i8* noundef %0, %struct.statfs* noundef %1) #0 {
  %3 = bitcast %struct.statfs* %1 to i8*
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(120) %3, i8 0, i64 120, i1 false)
  %4 = ptrtoint i8* %0 to i64
  %5 = ptrtoint %struct.statfs* %1 to i64
  %6 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 137, i64 %4, i64 %5) #4, !srcloc !3
  %7 = tail call i64 @__syscall_ret(i64 noundef %6) #5
  %8 = trunc i64 %7 to i32
  ret i32 %8
}

; Function Attrs: nounwind optsize strictfp
define internal i32 @__fstatfs(i32 noundef %0, %struct.statfs* noundef %1) #0 {
  %3 = bitcast %struct.statfs* %1 to i8*
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(120) %3, i8 0, i64 120, i1 false)
  %4 = sext i32 %0 to i64
  %5 = ptrtoint %struct.statfs* %1 to i64
  %6 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 138, i64 %4, i64 %5) #4, !srcloc !3
  %7 = tail call i64 @__syscall_ret(i64 noundef %6) #5
  %8 = trunc i64 %7 to i32
  ret i32 %8
}

; Function Attrs: nounwind optsize strictfp
define i32 @statvfs(i8* noalias noundef %0, %struct.statvfs* noalias nocapture noundef writeonly %1) #0 {
  %3 = alloca %struct.statfs, align 8
  %4 = bitcast %struct.statfs* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 120, i8* nonnull %4) #4
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(120) %4, i8 0, i64 120, i1 false) #6
  %5 = ptrtoint i8* %0 to i64
  %6 = ptrtoint %struct.statfs* %3 to i64
  %7 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 137, i64 %5, i64 %6) #4, !srcloc !3
  %8 = call i64 @__syscall_ret(i64 noundef %7) #5
  %9 = and i64 %8, 2147483648
  %10 = icmp eq i64 %9, 0
  br i1 %10, label %11, label %46

11:                                               ; preds = %2
  %12 = getelementptr inbounds %struct.statvfs, %struct.statvfs* %1, i64 0, i32 11
  %13 = bitcast [6 x i32]* %12 to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(112) %13, i8 0, i64 24, i1 false) #6
  %14 = getelementptr inbounds %struct.statfs, %struct.statfs* %3, i64 0, i32 1
  %15 = load i64, i64* %14, align 8, !tbaa !4
  %16 = getelementptr inbounds %struct.statvfs, %struct.statvfs* %1, i64 0, i32 0
  store i64 %15, i64* %16, align 8, !tbaa !10
  %17 = getelementptr inbounds %struct.statfs, %struct.statfs* %3, i64 0, i32 9
  %18 = load i64, i64* %17, align 8, !tbaa !12
  %19 = icmp eq i64 %18, 0
  %20 = select i1 %19, i64 %15, i64 %18
  %21 = getelementptr inbounds %struct.statvfs, %struct.statvfs* %1, i64 0, i32 1
  store i64 %20, i64* %21, align 8, !tbaa !13
  %22 = getelementptr inbounds %struct.statfs, %struct.statfs* %3, i64 0, i32 2
  %23 = getelementptr inbounds %struct.statvfs, %struct.statvfs* %1, i64 0, i32 2
  %24 = bitcast i64* %22 to <2 x i64>*
  %25 = load <2 x i64>, <2 x i64>* %24, align 8, !tbaa !14
  %26 = bitcast i64* %23 to <2 x i64>*
  store <2 x i64> %25, <2 x i64>* %26, align 8, !tbaa !14
  %27 = getelementptr inbounds %struct.statfs, %struct.statfs* %3, i64 0, i32 4
  %28 = getelementptr inbounds %struct.statvfs, %struct.statvfs* %1, i64 0, i32 4
  %29 = bitcast i64* %27 to <2 x i64>*
  %30 = load <2 x i64>, <2 x i64>* %29, align 8, !tbaa !14
  %31 = bitcast i64* %28 to <2 x i64>*
  store <2 x i64> %30, <2 x i64>* %31, align 8, !tbaa !14
  %32 = getelementptr inbounds %struct.statfs, %struct.statfs* %3, i64 0, i32 6
  %33 = load i64, i64* %32, align 8, !tbaa !15
  %34 = getelementptr inbounds %struct.statvfs, %struct.statvfs* %1, i64 0, i32 6
  store i64 %33, i64* %34, align 8, !tbaa !16
  %35 = getelementptr inbounds %struct.statvfs, %struct.statvfs* %1, i64 0, i32 7
  store i64 %33, i64* %35, align 8, !tbaa !17
  %36 = getelementptr inbounds %struct.statfs, %struct.statfs* %3, i64 0, i32 7, i32 0, i64 0
  %37 = load i32, i32* %36, align 8, !tbaa !18
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds %struct.statvfs, %struct.statvfs* %1, i64 0, i32 8
  store i64 %38, i64* %39, align 8, !tbaa !20
  %40 = getelementptr inbounds %struct.statfs, %struct.statfs* %3, i64 0, i32 10
  %41 = load i64, i64* %40, align 8, !tbaa !21
  %42 = getelementptr inbounds %struct.statvfs, %struct.statvfs* %1, i64 0, i32 9
  store i64 %41, i64* %42, align 8, !tbaa !22
  %43 = getelementptr inbounds %struct.statfs, %struct.statfs* %3, i64 0, i32 8
  %44 = load i64, i64* %43, align 8, !tbaa !23
  %45 = getelementptr inbounds %struct.statvfs, %struct.statvfs* %1, i64 0, i32 10
  store i64 %44, i64* %45, align 8, !tbaa !24
  br label %46

46:                                               ; preds = %2, %11
  %47 = phi i32 [ 0, %11 ], [ -1, %2 ]
  call void @llvm.lifetime.end.p0i8(i64 120, i8* nonnull %4) #4
  ret i32 %47
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind optsize strictfp
define i32 @fstatvfs(i32 noundef %0, %struct.statvfs* nocapture noundef writeonly %1) #0 {
  %3 = alloca %struct.statfs, align 8
  %4 = bitcast %struct.statfs* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 120, i8* nonnull %4) #4
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(120) %4, i8 0, i64 120, i1 false) #6
  %5 = sext i32 %0 to i64
  %6 = ptrtoint %struct.statfs* %3 to i64
  %7 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 138, i64 %5, i64 %6) #4, !srcloc !3
  %8 = call i64 @__syscall_ret(i64 noundef %7) #5
  %9 = and i64 %8, 2147483648
  %10 = icmp eq i64 %9, 0
  br i1 %10, label %11, label %46

11:                                               ; preds = %2
  %12 = getelementptr inbounds %struct.statvfs, %struct.statvfs* %1, i64 0, i32 11
  %13 = bitcast [6 x i32]* %12 to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(112) %13, i8 0, i64 24, i1 false) #6
  %14 = getelementptr inbounds %struct.statfs, %struct.statfs* %3, i64 0, i32 1
  %15 = load i64, i64* %14, align 8, !tbaa !4
  %16 = getelementptr inbounds %struct.statvfs, %struct.statvfs* %1, i64 0, i32 0
  store i64 %15, i64* %16, align 8, !tbaa !10
  %17 = getelementptr inbounds %struct.statfs, %struct.statfs* %3, i64 0, i32 9
  %18 = load i64, i64* %17, align 8, !tbaa !12
  %19 = icmp eq i64 %18, 0
  %20 = select i1 %19, i64 %15, i64 %18
  %21 = getelementptr inbounds %struct.statvfs, %struct.statvfs* %1, i64 0, i32 1
  store i64 %20, i64* %21, align 8, !tbaa !13
  %22 = getelementptr inbounds %struct.statfs, %struct.statfs* %3, i64 0, i32 2
  %23 = getelementptr inbounds %struct.statvfs, %struct.statvfs* %1, i64 0, i32 2
  %24 = bitcast i64* %22 to <2 x i64>*
  %25 = load <2 x i64>, <2 x i64>* %24, align 8, !tbaa !14
  %26 = bitcast i64* %23 to <2 x i64>*
  store <2 x i64> %25, <2 x i64>* %26, align 8, !tbaa !14
  %27 = getelementptr inbounds %struct.statfs, %struct.statfs* %3, i64 0, i32 4
  %28 = getelementptr inbounds %struct.statvfs, %struct.statvfs* %1, i64 0, i32 4
  %29 = bitcast i64* %27 to <2 x i64>*
  %30 = load <2 x i64>, <2 x i64>* %29, align 8, !tbaa !14
  %31 = bitcast i64* %28 to <2 x i64>*
  store <2 x i64> %30, <2 x i64>* %31, align 8, !tbaa !14
  %32 = getelementptr inbounds %struct.statfs, %struct.statfs* %3, i64 0, i32 6
  %33 = load i64, i64* %32, align 8, !tbaa !15
  %34 = getelementptr inbounds %struct.statvfs, %struct.statvfs* %1, i64 0, i32 6
  store i64 %33, i64* %34, align 8, !tbaa !16
  %35 = getelementptr inbounds %struct.statvfs, %struct.statvfs* %1, i64 0, i32 7
  store i64 %33, i64* %35, align 8, !tbaa !17
  %36 = getelementptr inbounds %struct.statfs, %struct.statfs* %3, i64 0, i32 7, i32 0, i64 0
  %37 = load i32, i32* %36, align 8, !tbaa !18
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds %struct.statvfs, %struct.statvfs* %1, i64 0, i32 8
  store i64 %38, i64* %39, align 8, !tbaa !20
  %40 = getelementptr inbounds %struct.statfs, %struct.statfs* %3, i64 0, i32 10
  %41 = load i64, i64* %40, align 8, !tbaa !21
  %42 = getelementptr inbounds %struct.statvfs, %struct.statvfs* %1, i64 0, i32 9
  store i64 %41, i64* %42, align 8, !tbaa !22
  %43 = getelementptr inbounds %struct.statfs, %struct.statfs* %3, i64 0, i32 8
  %44 = load i64, i64* %43, align 8, !tbaa !23
  %45 = getelementptr inbounds %struct.statvfs, %struct.statvfs* %1, i64 0, i32 10
  store i64 %44, i64* %45, align 8, !tbaa !24
  br label %46

46:                                               ; preds = %2, %11
  %47 = phi i32 [ 0, %11 ], [ -1, %2 ]
  call void @llvm.lifetime.end.p0i8(i64 120, i8* nonnull %4) #4
  ret i32 %47
}

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: optsize
declare hidden i64 @__syscall_ret(i64 noundef) local_unnamed_addr #3

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #3 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind strictfp }
attributes #5 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #6 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{i64 63849}
!4 = !{!5, !6, i64 8}
!5 = !{!"statfs", !6, i64 0, !6, i64 8, !6, i64 16, !6, i64 24, !6, i64 32, !6, i64 40, !6, i64 48, !9, i64 56, !6, i64 64, !6, i64 72, !6, i64 80, !7, i64 88}
!6 = !{!"long", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"__fsid_t", !7, i64 0}
!10 = !{!11, !6, i64 0}
!11 = !{!"statvfs", !6, i64 0, !6, i64 8, !6, i64 16, !6, i64 24, !6, i64 32, !6, i64 40, !6, i64 48, !6, i64 56, !6, i64 64, !6, i64 72, !6, i64 80, !7, i64 88}
!12 = !{!5, !6, i64 72}
!13 = !{!11, !6, i64 8}
!14 = !{!6, !6, i64 0}
!15 = !{!5, !6, i64 48}
!16 = !{!11, !6, i64 48}
!17 = !{!11, !6, i64 56}
!18 = !{!19, !19, i64 0}
!19 = !{!"int", !7, i64 0}
!20 = !{!11, !6, i64 64}
!21 = !{!5, !6, i64 80}
!22 = !{!11, !6, i64 72}
!23 = !{!5, !6, i64 64}
!24 = !{!11, !6, i64 80}
