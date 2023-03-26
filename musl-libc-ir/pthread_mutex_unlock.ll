; ModuleID = 'src/thread/pthread_mutex_unlock.c'
source_filename = "src/thread/pthread_mutex_unlock.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.pthread_mutex_t = type { %union.anon }
%union.anon = type { [5 x i8*] }
%struct.__pthread = type { %struct.__pthread*, i64*, %struct.__pthread*, %struct.__pthread*, i64, i64, i32, i32, i32, i32, i8, i8, i8, i8*, i64, i8*, i64, i64, i8*, %struct.__ptcb*, i8**, %struct.anon, i32, i32, %struct.__locale_struct*, [1 x i32], i8*, i8* }
%struct.__ptcb = type { void (i8*)*, i8*, %struct.__ptcb* }
%struct.anon = type { i8*, i64, i8* }
%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type opaque

@pthread_mutex_unlock = weak alias i32 (%struct.pthread_mutex_t*), i32 (%struct.pthread_mutex_t*)* @__pthread_mutex_unlock

; Function Attrs: nounwind optsize strictfp
define hidden i32 @__pthread_mutex_unlock(%struct.pthread_mutex_t* noundef %0) #0 {
  %2 = bitcast %struct.pthread_mutex_t* %0 to [10 x i32]*
  %3 = getelementptr inbounds %struct.pthread_mutex_t, %struct.pthread_mutex_t* %0, i64 0, i32 0, i32 0, i64 1
  %4 = bitcast i8** %3 to i32*
  %5 = load volatile i32, i32* %4, align 8, !tbaa !3
  %6 = bitcast %struct.pthread_mutex_t* %0 to i32*
  %7 = load i32, i32* %6, align 8, !tbaa !3
  %8 = and i32 %7, 15
  %9 = and i32 %7, 128
  %10 = xor i32 %9, 128
  %11 = icmp eq i32 %8, 0
  br i1 %11, label %57, label %12

12:                                               ; preds = %1
  %13 = tail call i64 asm "mov %fs:0,$0", "=r,~{dirflag},~{fpsr},~{flags}"() #2, !srcloc !6
  %14 = inttoptr i64 %13 to %struct.__pthread*
  %15 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 1
  %16 = load volatile i32, i32* %15, align 4, !tbaa !3
  %17 = and i32 %16, 1073741823
  %18 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %14, i64 0, i32 6
  %19 = load i32, i32* %18, align 8, !tbaa !7
  %20 = icmp eq i32 %17, %19
  br i1 %20, label %21, label %103

21:                                               ; preds = %12
  %22 = and i32 %7, 3
  %23 = icmp eq i32 %22, 1
  br i1 %23, label %24, label %30

24:                                               ; preds = %21
  %25 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 5
  %26 = load i32, i32* %25, align 4, !tbaa !3
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %30, label %28

28:                                               ; preds = %24
  %29 = add nsw i32 %26, -1
  store i32 %29, i32* %25, align 4, !tbaa !3
  br label %103

30:                                               ; preds = %24, %21
  %31 = and i32 %7, 4
  %32 = icmp eq i32 %31, 0
  %33 = and i32 %16, 1073741824
  %34 = icmp eq i32 %33, 0
  %35 = select i1 %32, i1 true, i1 %34
  %36 = select i1 %35, i32 0, i32 2147483647
  %37 = icmp eq i32 %10, 0
  br i1 %37, label %38, label %42

38:                                               ; preds = %30
  %39 = getelementptr inbounds %struct.pthread_mutex_t, %struct.pthread_mutex_t* %0, i64 0, i32 0, i32 0, i64 4
  %40 = bitcast i8** %39 to i8*
  %41 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %14, i64 0, i32 21, i32 2
  store volatile i8* %40, i8** %41, align 8, !tbaa !13
  tail call void @__vm_lock() #3
  br label %42

42:                                               ; preds = %38, %30
  %43 = getelementptr inbounds %struct.pthread_mutex_t, %struct.pthread_mutex_t* %0, i64 0, i32 0, i32 0, i64 3
  %44 = load volatile i8*, i8** %43, align 8, !tbaa !3
  %45 = getelementptr inbounds %struct.pthread_mutex_t, %struct.pthread_mutex_t* %0, i64 0, i32 0, i32 0, i64 4
  %46 = load volatile i8*, i8** %45, align 8, !tbaa !3
  %47 = bitcast i8* %44 to i8**
  store volatile i8* %46, i8** %47, align 8, !tbaa !14
  %48 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %14, i64 0, i32 21, i32 0
  %49 = bitcast i8** %48 to i8*
  %50 = icmp eq i8* %46, %49
  br i1 %50, label %54, label %51

51:                                               ; preds = %42
  %52 = getelementptr inbounds i8, i8* %46, i64 -8
  %53 = bitcast i8* %52 to i8**
  store volatile i8* %44, i8** %53, align 8, !tbaa !14
  br label %54

54:                                               ; preds = %42, %51
  %55 = and i32 %7, 8
  %56 = icmp eq i32 %55, 0
  br i1 %56, label %77, label %63

57:                                               ; preds = %1
  %58 = and i32 %7, 8
  %59 = icmp eq i32 %58, 0
  br i1 %59, label %77, label %60

60:                                               ; preds = %57
  %61 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 1
  %62 = tail call i32 asm sideeffect "lock ; cmpxchg $3, $1", "={ax},=*m,{ax},r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %61, i32 undef, i32 0) #4, !srcloc !15
  br label %70

63:                                               ; preds = %54
  %64 = icmp slt i32 %16, 0
  br i1 %64, label %68, label %65

65:                                               ; preds = %63
  %66 = tail call i32 asm sideeffect "lock ; cmpxchg $3, $1", "={ax},=*m,{ax},r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %15, i32 %16, i32 %36) #4, !srcloc !15
  %67 = icmp eq i32 %66, %16
  br i1 %67, label %82, label %68

68:                                               ; preds = %65, %63
  br i1 %35, label %70, label %69

69:                                               ; preds = %68
  tail call void asm sideeffect "mov $1, $0 ; lock ; orl $$0,(%rsp)", "=*m,r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %4, i32 -1) #4, !srcloc !16
  br label %70

70:                                               ; preds = %60, %69, %68
  %71 = phi %struct.__pthread* [ undef, %60 ], [ %14, %69 ], [ %14, %68 ]
  %72 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 1
  %73 = ptrtoint i32* %72 to i64
  %74 = or i32 %10, 7
  %75 = zext i32 %74 to i64
  %76 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %73, i64 %75) #4, !srcloc !17
  br label %82

77:                                               ; preds = %57, %54
  %78 = phi %struct.__pthread* [ undef, %57 ], [ %14, %54 ]
  %79 = phi i32 [ 0, %57 ], [ %36, %54 ]
  %80 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 1
  %81 = tail call i32 asm sideeffect "xchg $0, $1", "=r,=*m,0,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %80, i32 %79) #4, !srcloc !18
  br label %82

82:                                               ; preds = %65, %70, %77
  %83 = phi %struct.__pthread* [ %78, %77 ], [ %71, %70 ], [ %14, %65 ]
  %84 = phi i32 [ %81, %77 ], [ 0, %70 ], [ 0, %65 ]
  %85 = phi i32 [ %5, %77 ], [ 0, %70 ], [ 0, %65 ]
  %86 = icmp ne i32 %10, 0
  %87 = select i1 %11, i1 true, i1 %86
  br i1 %87, label %90, label %88

88:                                               ; preds = %82
  %89 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %83, i64 0, i32 21, i32 2
  store volatile i8* null, i8** %89, align 8, !tbaa !13
  tail call void @__vm_unlock() #3
  br label %90

90:                                               ; preds = %88, %82
  %91 = icmp ne i32 %85, 0
  %92 = icmp slt i32 %84, 0
  %93 = select i1 %91, i1 true, i1 %92
  br i1 %93, label %94, label %103

94:                                               ; preds = %90
  %95 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 1
  %96 = icmp eq i32 %10, 0
  %97 = ptrtoint i32* %95 to i64
  %98 = select i1 %96, i64 1, i64 129
  %99 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %97, i64 %98, i64 1) #4, !srcloc !19
  %100 = icmp eq i64 %99, -38
  br i1 %100, label %101, label %103

101:                                              ; preds = %94
  %102 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %97, i64 1, i64 1) #4, !srcloc !19
  br label %103

103:                                              ; preds = %101, %94, %28, %12, %90
  %104 = phi i32 [ 0, %90 ], [ 0, %28 ], [ 1, %12 ], [ 0, %94 ], [ 0, %101 ]
  ret i32 %104
}

; Function Attrs: optsize
declare hidden void @__vm_lock() local_unnamed_addr #1

; Function Attrs: optsize
declare hidden void @__vm_unlock() local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind readnone strictfp }
attributes #3 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #4 = { nounwind strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{i64 235259}
!7 = !{!8, !11, i64 48}
!8 = !{!"__pthread", !9, i64 0, !9, i64 8, !9, i64 16, !9, i64 24, !10, i64 32, !10, i64 40, !11, i64 48, !11, i64 52, !11, i64 56, !11, i64 60, !4, i64 64, !4, i64 65, !4, i64 66, !4, i64 66, !9, i64 72, !10, i64 80, !9, i64 88, !10, i64 96, !10, i64 104, !9, i64 112, !9, i64 120, !9, i64 128, !12, i64 136, !11, i64 160, !11, i64 164, !9, i64 168, !4, i64 176, !9, i64 184, !9, i64 192}
!9 = !{!"any pointer", !4, i64 0}
!10 = !{!"long", !4, i64 0}
!11 = !{!"int", !4, i64 0}
!12 = !{!"", !9, i64 0, !10, i64 8, !9, i64 16}
!13 = !{!8, !9, i64 152}
!14 = !{!9, !9, i64 0}
!15 = !{i64 232235}
!16 = !{i64 233945}
!17 = !{i64 204930}
!18 = !{i64 232635}
!19 = !{i64 205142}
