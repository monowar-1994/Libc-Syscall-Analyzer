; ModuleID = 'src/stat/fstatat.c'
source_filename = "src/stat/fstatat.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.stat = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i64, i64 }
%struct.kstat = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, [3 x i64] }

@fstatat64 = weak alias i32 (i32, i8*, %struct.stat*, i32), i32 (i32, i8*, %struct.stat*, i32)* @fstatat

; Function Attrs: nounwind optsize strictfp
define i32 @fstatat(i32 noundef %0, i8* noalias noundef %1, %struct.stat* noalias nocapture noundef writeonly %2, i32 noundef %3) #0 {
  %5 = alloca %struct.kstat, align 16
  %6 = alloca [27 x i8], align 16
  tail call void @llvm.experimental.noalias.scope.decl(metadata !3)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !6)
  %7 = bitcast %struct.kstat* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 144, i8* nonnull %7) #5, !noalias !8
  %8 = icmp eq i32 %3, 4096
  %9 = icmp sgt i32 %0, -1
  %10 = and i1 %9, %8
  br i1 %10, label %11, label %33

11:                                               ; preds = %4
  %12 = load i8, i8* %1, align 1, !tbaa !9, !alias.scope !3, !noalias !6
  %13 = icmp eq i8 %12, 0
  br i1 %13, label %14, label %55

14:                                               ; preds = %11
  %15 = zext i32 %0 to i64
  %16 = ptrtoint %struct.kstat* %5 to i64
  %17 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 5, i64 %15, i64 %16) #5, !noalias !8, !srcloc !12
  %18 = trunc i64 %17 to i32
  %19 = icmp eq i32 %18, -9
  br i1 %19, label %20, label %62

20:                                               ; preds = %14
  %21 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 72, i64 %15, i64 1) #5, !noalias !8, !srcloc !12
  %22 = icmp sgt i64 %21, -1
  br i1 %22, label %23, label %109

23:                                               ; preds = %20
  %24 = ptrtoint i8* %1 to i64
  %25 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},{r10},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 262, i64 %15, i64 %24, i64 %16, i64 4096) #5, !noalias !6, !srcloc !13
  %26 = trunc i64 %25 to i32
  %27 = icmp eq i32 %26, -22
  br i1 %27, label %28, label %62

28:                                               ; preds = %23
  %29 = getelementptr inbounds [27 x i8], [27 x i8]* %6, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 27, i8* nonnull %29) #5, !noalias !8
  call void @__procfdname(i8* noundef nonnull %29, i32 noundef %0) #6, !noalias !6
  %30 = ptrtoint [27 x i8]* %6 to i64
  %31 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 4, i64 %30, i64 %16) #5, !noalias !6, !srcloc !12
  %32 = trunc i64 %31 to i32
  call void @llvm.lifetime.end.p0i8(i64 27, i8* nonnull %29) #5, !noalias !8
  br label %62

33:                                               ; preds = %4
  %34 = icmp eq i32 %0, -100
  br i1 %34, label %40, label %35

35:                                               ; preds = %33
  %36 = load i8, i8* %1, align 1, !tbaa !9, !alias.scope !3, !noalias !6
  %37 = icmp eq i8 %36, 47
  %38 = icmp eq i32 %3, 256
  %39 = and i1 %38, %37
  br i1 %39, label %41, label %46

40:                                               ; preds = %33
  switch i32 %3, label %55 [
    i32 256, label %41
    i32 0, label %50
  ]

41:                                               ; preds = %40, %35
  %42 = ptrtoint i8* %1 to i64
  %43 = ptrtoint %struct.kstat* %5 to i64
  %44 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 6, i64 %42, i64 %43) #5, !noalias !6, !srcloc !12
  %45 = trunc i64 %44 to i32
  br label %62

46:                                               ; preds = %35
  %47 = icmp ne i8 %36, 47
  %48 = icmp ne i32 %3, 0
  %49 = or i1 %48, %47
  br i1 %49, label %55, label %50

50:                                               ; preds = %46, %40
  %51 = ptrtoint i8* %1 to i64
  %52 = ptrtoint %struct.kstat* %5 to i64
  %53 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 4, i64 %51, i64 %52) #5, !noalias !6, !srcloc !12
  %54 = trunc i64 %53 to i32
  br label %62

55:                                               ; preds = %46, %40, %11
  %56 = sext i32 %0 to i64
  %57 = ptrtoint i8* %1 to i64
  %58 = ptrtoint %struct.kstat* %5 to i64
  %59 = sext i32 %3 to i64
  %60 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},{r10},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 262, i64 %56, i64 %57, i64 %58, i64 %59) #5, !noalias !6, !srcloc !13
  %61 = trunc i64 %60 to i32
  br label %62

62:                                               ; preds = %55, %50, %41, %28, %23, %14
  %63 = phi i32 [ %45, %41 ], [ %61, %55 ], [ %54, %50 ], [ %32, %28 ], [ %26, %23 ], [ %18, %14 ]
  %64 = icmp eq i32 %63, 0
  br i1 %64, label %65, label %109

65:                                               ; preds = %62
  %66 = bitcast %struct.kstat* %5 to <2 x i64>*
  %67 = load <2 x i64>, <2 x i64>* %66, align 16, !tbaa !14, !noalias !8
  %68 = getelementptr inbounds %struct.kstat, %struct.kstat* %5, i64 0, i32 2
  %69 = load i64, i64* %68, align 16, !tbaa !16, !noalias !8
  %70 = getelementptr inbounds %struct.kstat, %struct.kstat* %5, i64 0, i32 3
  %71 = load i32, i32* %70, align 8, !tbaa !19, !noalias !8
  %72 = getelementptr inbounds %struct.kstat, %struct.kstat* %5, i64 0, i32 4
  %73 = load i32, i32* %72, align 4, !tbaa !20, !noalias !8
  %74 = getelementptr inbounds %struct.kstat, %struct.kstat* %5, i64 0, i32 5
  %75 = load i32, i32* %74, align 16, !tbaa !21, !noalias !8
  %76 = getelementptr inbounds %struct.kstat, %struct.kstat* %5, i64 0, i32 7
  %77 = bitcast i64* %76 to <2 x i64>*
  %78 = load <2 x i64>, <2 x i64>* %77, align 8, !tbaa !14, !noalias !8
  %79 = getelementptr inbounds %struct.kstat, %struct.kstat* %5, i64 0, i32 9
  %80 = bitcast i64* %79 to <2 x i64>*
  %81 = load <2 x i64>, <2 x i64>* %80, align 8, !tbaa !14, !noalias !8
  %82 = getelementptr inbounds %struct.kstat, %struct.kstat* %5, i64 0, i32 11
  %83 = bitcast i64* %82 to <2 x i64>*
  %84 = load <2 x i64>, <2 x i64>* %83, align 8, !tbaa !14, !noalias !8
  %85 = getelementptr inbounds %struct.kstat, %struct.kstat* %5, i64 0, i32 13
  %86 = bitcast i64* %85 to <2 x i64>*
  %87 = load <2 x i64>, <2 x i64>* %86, align 8, !tbaa !14, !noalias !8
  %88 = getelementptr inbounds %struct.kstat, %struct.kstat* %5, i64 0, i32 15
  %89 = bitcast i64* %88 to <2 x i64>*
  %90 = load <2 x i64>, <2 x i64>* %89, align 8, !tbaa !14, !noalias !8
  %91 = bitcast %struct.stat* %2 to <2 x i64>*
  store <2 x i64> %67, <2 x i64>* %91, align 8, !alias.scope !6, !noalias !3
  %92 = getelementptr inbounds %struct.stat, %struct.stat* %2, i64 0, i32 2
  store i64 %69, i64* %92, align 8, !tbaa.struct !22, !alias.scope !6, !noalias !3
  %93 = getelementptr inbounds %struct.stat, %struct.stat* %2, i64 0, i32 3
  store i32 %71, i32* %93, align 8, !tbaa.struct !24, !alias.scope !6, !noalias !3
  %94 = getelementptr inbounds %struct.stat, %struct.stat* %2, i64 0, i32 4
  store i32 %73, i32* %94, align 4, !tbaa.struct !25, !alias.scope !6, !noalias !3
  %95 = getelementptr inbounds %struct.stat, %struct.stat* %2, i64 0, i32 5
  store i32 %75, i32* %95, align 8, !tbaa.struct !26, !alias.scope !6, !noalias !3
  %96 = getelementptr inbounds %struct.stat, %struct.stat* %2, i64 0, i32 6
  store i32 0, i32* %96, align 4, !tbaa.struct !27, !alias.scope !6, !noalias !3
  %97 = getelementptr inbounds %struct.stat, %struct.stat* %2, i64 0, i32 7
  %98 = bitcast i64* %97 to <2 x i64>*
  store <2 x i64> %78, <2 x i64>* %98, align 8, !alias.scope !6, !noalias !3
  %99 = getelementptr inbounds %struct.stat, %struct.stat* %2, i64 0, i32 9
  %100 = bitcast i64* %99 to <2 x i64>*
  store <2 x i64> %81, <2 x i64>* %100, align 8, !alias.scope !6, !noalias !3
  %101 = getelementptr inbounds %struct.stat, %struct.stat* %2, i64 0, i32 11, i32 0
  %102 = bitcast i64* %101 to <2 x i64>*
  store <2 x i64> %84, <2 x i64>* %102, align 8, !alias.scope !6, !noalias !3
  %103 = getelementptr inbounds %struct.stat, %struct.stat* %2, i64 0, i32 12, i32 0
  %104 = bitcast i64* %103 to <2 x i64>*
  store <2 x i64> %87, <2 x i64>* %104, align 8, !alias.scope !6, !noalias !3
  %105 = getelementptr inbounds %struct.stat, %struct.stat* %2, i64 0, i32 13, i32 0
  %106 = bitcast i64* %105 to <2 x i64>*
  store <2 x i64> %90, <2 x i64>* %106, align 8, !alias.scope !6, !noalias !3
  %107 = getelementptr inbounds %struct.stat, %struct.stat* %2, i64 0, i32 14
  %108 = bitcast [3 x i64]* %107 to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(24) %108, i8 0, i64 24, i1 false) #7, !alias.scope !6, !noalias !3
  br label %109

109:                                              ; preds = %20, %62, %65
  %110 = phi i32 [ 0, %65 ], [ %63, %62 ], [ -9, %20 ]
  call void @llvm.lifetime.end.p0i8(i64 144, i8* nonnull %7) #5, !noalias !8
  %111 = sext i32 %110 to i64
  %112 = call i64 @__syscall_ret(i64 noundef %111) #6
  %113 = trunc i64 %112 to i32
  ret i32 %113
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare hidden i64 @__syscall_ret(i64 noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare hidden void @__procfdname(i8* noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: inaccessiblememonly nofree nosync nounwind willreturn
declare void @llvm.experimental.noalias.scope.decl(metadata) #4

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #4 = { inaccessiblememonly nofree nosync nounwind willreturn }
attributes #5 = { nounwind strictfp }
attributes #6 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #7 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4}
!4 = distinct !{!4, !5, !"fstatat_kstat: argument 0"}
!5 = distinct !{!5, !"fstatat_kstat"}
!6 = !{!7}
!7 = distinct !{!7, !5, !"fstatat_kstat: argument 1"}
!8 = !{!4, !7}
!9 = !{!10, !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{i64 127720}
!13 = !{i64 128202}
!14 = !{!15, !15, i64 0}
!15 = !{!"long", !10, i64 0}
!16 = !{!17, !15, i64 16}
!17 = !{!"kstat", !15, i64 0, !15, i64 8, !15, i64 16, !18, i64 24, !18, i64 28, !18, i64 32, !18, i64 36, !15, i64 40, !15, i64 48, !15, i64 56, !15, i64 64, !15, i64 72, !15, i64 80, !15, i64 88, !15, i64 96, !15, i64 104, !15, i64 112, !10, i64 120}
!18 = !{!"int", !10, i64 0}
!19 = !{!17, !18, i64 24}
!20 = !{!17, !18, i64 28}
!21 = !{!17, !18, i64 32}
!22 = !{i64 0, i64 8, !14, i64 8, i64 4, !23, i64 12, i64 4, !23, i64 16, i64 4, !23, i64 20, i64 4, !23, i64 24, i64 8, !14, i64 32, i64 8, !14, i64 40, i64 8, !14, i64 48, i64 8, !14, i64 56, i64 8, !14, i64 64, i64 8, !14, i64 72, i64 8, !14, i64 80, i64 8, !14, i64 88, i64 8, !14, i64 96, i64 8, !14, i64 104, i64 24, !9}
!23 = !{!18, !18, i64 0}
!24 = !{i64 0, i64 4, !23, i64 4, i64 4, !23, i64 8, i64 4, !23, i64 12, i64 4, !23, i64 16, i64 8, !14, i64 24, i64 8, !14, i64 32, i64 8, !14, i64 40, i64 8, !14, i64 48, i64 8, !14, i64 56, i64 8, !14, i64 64, i64 8, !14, i64 72, i64 8, !14, i64 80, i64 8, !14, i64 88, i64 8, !14, i64 96, i64 24, !9}
!25 = !{i64 0, i64 4, !23, i64 4, i64 4, !23, i64 8, i64 4, !23, i64 12, i64 8, !14, i64 20, i64 8, !14, i64 28, i64 8, !14, i64 36, i64 8, !14, i64 44, i64 8, !14, i64 52, i64 8, !14, i64 60, i64 8, !14, i64 68, i64 8, !14, i64 76, i64 8, !14, i64 84, i64 8, !14, i64 92, i64 24, !9}
!26 = !{i64 0, i64 4, !23, i64 4, i64 4, !23, i64 8, i64 8, !14, i64 16, i64 8, !14, i64 24, i64 8, !14, i64 32, i64 8, !14, i64 40, i64 8, !14, i64 48, i64 8, !14, i64 56, i64 8, !14, i64 64, i64 8, !14, i64 72, i64 8, !14, i64 80, i64 8, !14, i64 88, i64 24, !9}
!27 = !{i64 0, i64 4, !23, i64 4, i64 8, !14, i64 12, i64 8, !14, i64 20, i64 8, !14, i64 28, i64 8, !14, i64 36, i64 8, !14, i64 44, i64 8, !14, i64 52, i64 8, !14, i64 60, i64 8, !14, i64 68, i64 8, !14, i64 76, i64 8, !14, i64 84, i64 24, !9}
