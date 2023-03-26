; ModuleID = 'src/time/__map_file.c'
source_filename = "src/time/__map_file.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.kstat = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, [3 x i64] }

; Function Attrs: nounwind optsize strictfp
define hidden i8* @__map_file(i8* noundef %0, i64* nocapture noundef writeonly %1) local_unnamed_addr #0 {
  %3 = alloca %struct.kstat, align 8
  %4 = bitcast %struct.kstat* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 144, i8* nonnull %4) #3
  %5 = ptrtoint i8* %0 to i64
  %6 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 2, i64 %5, i64 559104) #3, !srcloc !3
  %7 = tail call i64 @__syscall_ret(i64 noundef %6) #4
  %8 = trunc i64 %7 to i32
  %9 = icmp slt i32 %8, 0
  br i1 %9, label %27, label %10

10:                                               ; preds = %2
  %11 = shl i64 %7, 32
  %12 = ashr exact i64 %11, 32
  %13 = ptrtoint %struct.kstat* %3 to i64
  %14 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 5, i64 %12, i64 %13) #3, !srcloc !3
  %15 = call i64 @__syscall_ret(i64 noundef %14) #4
  %16 = icmp eq i64 %15, 0
  br i1 %16, label %17, label %22

17:                                               ; preds = %10
  %18 = getelementptr inbounds %struct.kstat, %struct.kstat* %3, i64 0, i32 8
  %19 = load i64, i64* %18, align 8, !tbaa !4
  %20 = call i8* @__mmap(i8* noundef null, i64 noundef %19, i32 noundef 1, i32 noundef 1, i32 noundef %8, i64 noundef 0) #4
  %21 = load i64, i64* %18, align 8, !tbaa !4
  store i64 %21, i64* %1, align 8, !tbaa !10
  br label %22

22:                                               ; preds = %17, %10
  %23 = phi i8* [ inttoptr (i64 -1 to i8*), %10 ], [ %20, %17 ]
  %24 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 3, i64 %12) #3, !srcloc !11
  %25 = icmp eq i8* %23, inttoptr (i64 -1 to i8*)
  %26 = select i1 %25, i8* null, i8* %23
  br label %27

27:                                               ; preds = %2, %22
  %28 = phi i8* [ %26, %22 ], [ null, %2 ]
  call void @llvm.lifetime.end.p0i8(i64 144, i8* nonnull %4) #3
  ret i8* %28
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare hidden i64 @__syscall_ret(i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden i8* @__mmap(i8* noundef, i64 noundef, i32 noundef, i32 noundef, i32 noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind strictfp }
attributes #4 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{i64 97706}
!4 = !{!5, !6, i64 48}
!5 = !{!"kstat", !6, i64 0, !6, i64 8, !6, i64 16, !9, i64 24, !9, i64 28, !9, i64 32, !9, i64 36, !6, i64 40, !6, i64 48, !6, i64 56, !6, i64 64, !6, i64 72, !6, i64 80, !6, i64 88, !6, i64 96, !6, i64 104, !6, i64 112, !7, i64 120}
!6 = !{!"long", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!6, !6, i64 0}
!11 = !{i64 97520}
