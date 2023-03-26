; ModuleID = 'src/time/clock_getcpuclockid.c'
source_filename = "src/time/clock_getcpuclockid.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.timespec = type { i64, i64 }

; Function Attrs: nounwind optsize strictfp
define i32 @clock_getcpuclockid(i32 noundef %0, i32* nocapture noundef writeonly %1) local_unnamed_addr #0 {
  %3 = alloca %struct.timespec, align 8
  %4 = bitcast %struct.timespec* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %4) #2
  %5 = xor i32 %0, -1
  %6 = shl i32 %5, 3
  %7 = or i32 %6, 2
  %8 = sext i32 %7 to i64
  %9 = ptrtoint %struct.timespec* %3 to i64
  %10 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 229, i64 %8, i64 %9) #2, !srcloc !3
  %11 = trunc i64 %10 to i32
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %15, label %13

13:                                               ; preds = %2
  %14 = sub nsw i32 0, %11
  br label %16

15:                                               ; preds = %2
  store i32 %7, i32* %1, align 4, !tbaa !4
  br label %16

16:                                               ; preds = %15, %13
  %17 = phi i32 [ %14, %13 ], [ 0, %15 ]
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %4) #2
  ret i32 %17
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { nounwind strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{i64 91690}
!4 = !{!5, !5, i64 0}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
