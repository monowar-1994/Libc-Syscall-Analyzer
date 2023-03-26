; ModuleID = 'src/thread/pthread_mutex_timedlock.c'
source_filename = "src/thread/pthread_mutex_timedlock.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.pthread_mutex_t = type { %union.anon }
%union.anon = type { [5 x i8*] }
%struct.timespec = type { i64, i64 }
%struct.__pthread = type { %struct.__pthread*, i64*, %struct.__pthread*, %struct.__pthread*, i64, i64, i32, i32, i32, i32, i8, i8, i8, i8*, i64, i8*, i64, i64, i8*, %struct.__ptcb*, i8**, %struct.anon, i32, i32, %struct.__locale_struct*, [1 x i32], i8*, i8* }
%struct.__ptcb = type { void (i8*)*, i8*, %struct.__ptcb* }
%struct.anon = type { i8*, i64, i8* }
%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type opaque

@pthread_mutex_timedlock = weak alias i32 (%struct.pthread_mutex_t*, %struct.timespec*), i32 (%struct.pthread_mutex_t*, %struct.timespec*)* @__pthread_mutex_timedlock

; Function Attrs: nounwind optsize strictfp
define hidden i32 @__pthread_mutex_timedlock(%struct.pthread_mutex_t* noalias noundef %0, %struct.timespec* noalias noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = bitcast %struct.pthread_mutex_t* %0 to [10 x i32]*
  %5 = bitcast %struct.pthread_mutex_t* %0 to i32*
  %6 = load i32, i32* %5, align 8, !tbaa !3
  %7 = and i32 %6, 15
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %15

9:                                                ; preds = %2
  %10 = getelementptr inbounds [10 x i32], [10 x i32]* %4, i64 0, i64 1
  %11 = tail call i32 asm sideeffect "lock ; cmpxchg $3, $1", "={ax},=*m,{ax},r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %10, i32 0, i32 16) #4, !srcloc !6
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %125, label %13

13:                                               ; preds = %9
  %14 = load i32, i32* %5, align 8, !tbaa !3
  br label %15

15:                                               ; preds = %13, %2
  %16 = phi i32 [ %14, %13 ], [ %6, %2 ]
  %17 = and i32 %16, 128
  %18 = xor i32 %17, 128
  %19 = tail call i32 @__pthread_mutex_trylock(%struct.pthread_mutex_t* noundef nonnull %0) #5
  %20 = icmp eq i32 %19, 16
  br i1 %20, label %21, label %125

21:                                               ; preds = %15
  %22 = and i32 %16, 8
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %24, label %28

24:                                               ; preds = %21
  %25 = getelementptr inbounds [10 x i32], [10 x i32]* %4, i64 0, i64 1
  %26 = getelementptr inbounds %struct.pthread_mutex_t, %struct.pthread_mutex_t* %0, i64 0, i32 0, i32 0, i64 1
  %27 = bitcast i8** %26 to i32*
  br label %84

28:                                               ; preds = %21
  tail call void @llvm.experimental.noalias.scope.decl(metadata !7)
  %29 = bitcast i32* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %29)
  %30 = load i32, i32* %5, align 8, !tbaa !3, !alias.scope !7, !noalias !10
  %31 = and i32 %30, 128
  %32 = xor i32 %31, 128
  %33 = tail call i64 asm "mov %fs:0,$0", "=r,~{dirflag},~{fpsr},~{flags}"() #6, !srcloc !12
  %34 = inttoptr i64 %33 to %struct.__pthread*
  %35 = icmp eq i32 %32, 0
  br i1 %35, label %36, label %40

36:                                               ; preds = %28
  %37 = getelementptr inbounds %struct.pthread_mutex_t, %struct.pthread_mutex_t* %0, i64 0, i32 0, i32 0, i64 4
  %38 = bitcast i8** %37 to i8*
  %39 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %34, i64 0, i32 21, i32 2
  store volatile i8* %38, i8** %39, align 8, !tbaa !13, !noalias !19
  br label %40

40:                                               ; preds = %36, %28
  %41 = getelementptr inbounds [10 x i32], [10 x i32]* %4, i64 0, i64 1
  %42 = or i32 %32, 6
  %43 = ptrtoint i32* %41 to i64
  %44 = zext i32 %42 to i64
  %45 = ptrtoint %struct.timespec* %1 to i64
  br label %46

46:                                               ; preds = %46, %40
  %47 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},{r10},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %43, i64 %44, i64 0, i64 %45) #4, !srcloc !20
  %48 = trunc i64 %47 to i32
  switch i32 %48, label %49 [
    i32 -4, label %46
    i32 0, label %53
  ]

49:                                               ; preds = %46
  %50 = trunc i64 %47 to i32
  %51 = sub nsw i32 0, %50
  %52 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %34, i64 0, i32 21, i32 2
  store volatile i8* null, i8** %52, align 8, !tbaa !13
  switch i32 %51, label %78 [
    i32 0, label %53
    i32 110, label %82
    i32 35, label %75
  ]

53:                                               ; preds = %46, %49
  %54 = and i32 %30, 4
  %55 = icmp eq i32 %54, 0
  br i1 %55, label %56, label %72

56:                                               ; preds = %53
  %57 = load volatile i32, i32* %41, align 4, !tbaa !3, !alias.scope !7, !noalias !10
  %58 = and i32 %57, 1073741824
  %59 = icmp eq i32 %58, 0
  br i1 %59, label %60, label %65

60:                                               ; preds = %56
  %61 = getelementptr inbounds %struct.pthread_mutex_t, %struct.pthread_mutex_t* %0, i64 0, i32 0, i32 0, i64 1
  %62 = bitcast i8** %61 to i32*
  %63 = load volatile i32, i32* %62, align 8, !tbaa !3, !alias.scope !7, !noalias !10
  %64 = icmp eq i32 %63, 0
  br i1 %64, label %72, label %65

65:                                               ; preds = %56, %60
  %66 = getelementptr inbounds %struct.pthread_mutex_t, %struct.pthread_mutex_t* %0, i64 0, i32 0, i32 0, i64 1
  %67 = bitcast i8** %66 to i32*
  tail call void asm sideeffect "mov $1, $0 ; lock ; orl $$0,(%rsp)", "=*m,r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %67, i32 -1) #4, !srcloc !21
  %68 = or i32 %32, 7
  %69 = zext i32 %68 to i64
  %70 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %43, i64 %69) #4, !srcloc !22
  %71 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %34, i64 0, i32 21, i32 2
  store volatile i8* null, i8** %71, align 8, !tbaa !13
  br label %78

72:                                               ; preds = %60, %53
  %73 = getelementptr inbounds [10 x i32], [10 x i32]* %4, i64 0, i64 5
  store i32 -1, i32* %73, align 4, !tbaa !3, !alias.scope !7, !noalias !10
  %74 = tail call i32 @__pthread_mutex_trylock(%struct.pthread_mutex_t* noundef %0) #5
  br label %82

75:                                               ; preds = %49
  %76 = and i32 %30, 3
  %77 = icmp eq i32 %76, 2
  br i1 %77, label %82, label %78

78:                                               ; preds = %75, %65, %49
  br label %79

79:                                               ; preds = %78, %79
  store i32 0, i32* %3, align 4, !tbaa !23, !noalias !19
  %80 = call i32 @__timedwait(i32* noundef nonnull %3, i32 noundef 0, i32 noundef 0, %struct.timespec* noundef %1, i32 noundef 1) #5
  %81 = icmp eq i32 %80, 110
  br i1 %81, label %82, label %79

82:                                               ; preds = %79, %49, %72, %75
  %83 = phi i32 [ %74, %72 ], [ %51, %49 ], [ 35, %75 ], [ 110, %79 ]
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %29)
  br label %125

84:                                               ; preds = %24, %91
  %85 = phi i32 [ 99, %24 ], [ %92, %91 ]
  %86 = load volatile i32, i32* %25, align 4, !tbaa !3
  %87 = icmp eq i32 %86, 0
  br i1 %87, label %94, label %88

88:                                               ; preds = %84
  %89 = load volatile i32, i32* %27, align 8, !tbaa !3
  %90 = icmp eq i32 %89, 0
  br i1 %90, label %91, label %94

91:                                               ; preds = %88
  tail call void asm sideeffect "pause", "~{memory},~{dirflag},~{fpsr},~{flags}"() #4, !srcloc !24
  %92 = add nsw i32 %85, -1
  %93 = icmp eq i32 %85, 0
  br i1 %93, label %94, label %84

94:                                               ; preds = %91, %84, %88
  %95 = tail call i32 @__pthread_mutex_trylock(%struct.pthread_mutex_t* noundef nonnull %0) #5
  %96 = icmp eq i32 %95, 16
  br i1 %96, label %97, label %125

97:                                               ; preds = %94
  %98 = and i32 %16, 4
  %99 = icmp eq i32 %98, 0
  %100 = and i32 %16, 3
  %101 = icmp eq i32 %100, 2
  br label %102

102:                                              ; preds = %97, %122
  %103 = load volatile i32, i32* %25, align 4, !tbaa !3
  %104 = and i32 %103, 1073741823
  %105 = icmp eq i32 %104, 0
  br i1 %105, label %106, label %109

106:                                              ; preds = %102
  %107 = icmp ne i32 %103, 0
  %108 = select i1 %107, i1 %99, i1 false
  br i1 %108, label %109, label %122

109:                                              ; preds = %106, %102
  br i1 %101, label %110, label %116

110:                                              ; preds = %109
  %111 = tail call i64 asm "mov %fs:0,$0", "=r,~{dirflag},~{fpsr},~{flags}"() #6, !srcloc !12
  %112 = inttoptr i64 %111 to %struct.__pthread*
  %113 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %112, i64 0, i32 6
  %114 = load i32, i32* %113, align 8, !tbaa !25
  %115 = icmp eq i32 %104, %114
  br i1 %115, label %125, label %116

116:                                              ; preds = %110, %109
  tail call void asm sideeffect "lock ; incl $0", "=*m,*m,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %27, i32* nonnull elementtype(i32) %27) #4, !srcloc !26
  %117 = or i32 %103, -2147483648
  %118 = tail call i32 asm sideeffect "lock ; cmpxchg $3, $1", "={ax},=*m,{ax},r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %25, i32 %103, i32 %117) #4, !srcloc !6
  %119 = tail call i32 @__timedwait(i32* noundef nonnull %25, i32 noundef %117, i32 noundef 0, %struct.timespec* noundef %1, i32 noundef %18) #5
  tail call void asm sideeffect "lock ; decl $0", "=*m,*m,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %27, i32* nonnull elementtype(i32) %27) #4, !srcloc !27
  %120 = and i32 %119, -5
  %121 = icmp eq i32 %120, 0
  br i1 %121, label %122, label %125

122:                                              ; preds = %116, %106
  %123 = tail call i32 @__pthread_mutex_trylock(%struct.pthread_mutex_t* noundef nonnull %0) #5
  %124 = icmp eq i32 %123, 16
  br i1 %124, label %102, label %125

125:                                              ; preds = %122, %110, %116, %94, %82, %15, %9
  %126 = phi i32 [ 0, %9 ], [ %83, %82 ], [ %19, %15 ], [ %95, %94 ], [ %123, %122 ], [ 35, %110 ], [ %119, %116 ]
  ret i32 %126
}

; Function Attrs: optsize
declare hidden i32 @__pthread_mutex_trylock(%struct.pthread_mutex_t* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare hidden i32 @__timedwait(i32* noundef, i32 noundef, i32 noundef, %struct.timespec* noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: inaccessiblememonly nofree nosync nounwind willreturn
declare void @llvm.experimental.noalias.scope.decl(metadata) #2

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #3

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { inaccessiblememonly nofree nosync nounwind willreturn }
attributes #3 = { argmemonly nofree nosync nounwind willreturn }
attributes #4 = { nounwind strictfp }
attributes #5 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #6 = { nounwind readnone strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{i64 233515}
!7 = !{!8}
!8 = distinct !{!8, !9, !"pthread_mutex_timedlock_pi: argument 0"}
!9 = distinct !{!9, !"pthread_mutex_timedlock_pi"}
!10 = !{!11}
!11 = distinct !{!11, !9, !"pthread_mutex_timedlock_pi: argument 1"}
!12 = !{i64 236539}
!13 = !{!14, !15, i64 152}
!14 = !{!"__pthread", !15, i64 0, !15, i64 8, !15, i64 16, !15, i64 24, !16, i64 32, !16, i64 40, !17, i64 48, !17, i64 52, !17, i64 56, !17, i64 60, !4, i64 64, !4, i64 65, !4, i64 66, !4, i64 66, !15, i64 72, !16, i64 80, !15, i64 88, !16, i64 96, !16, i64 104, !15, i64 112, !15, i64 120, !15, i64 128, !18, i64 136, !17, i64 160, !17, i64 164, !15, i64 168, !4, i64 176, !15, i64 184, !15, i64 192}
!15 = !{!"any pointer", !4, i64 0}
!16 = !{!"long", !4, i64 0}
!17 = !{!"int", !4, i64 0}
!18 = !{!"", !15, i64 0, !16, i64 8, !15, i64 16}
!19 = !{!8, !11}
!20 = !{i64 206692}
!21 = !{i64 235225}
!22 = !{i64 206210}
!23 = !{!17, !17, i64 0}
!24 = !{i64 235484}
!25 = !{!14, !17, i64 48}
!26 = !{i64 234920}
!27 = !{i64 235066}
