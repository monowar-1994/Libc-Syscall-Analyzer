; ModuleID = 'src/signal/siginterrupt.c'
source_filename = "src/signal/siginterrupt.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.sigaction = type { %union.anon, %struct.__sigset_t, i32, void ()* }
%union.anon = type { void (i32)* }
%struct.__sigset_t = type { [16 x i64] }

; Function Attrs: nounwind optsize strictfp
define i32 @siginterrupt(i32 noundef %0, i32 noundef %1) local_unnamed_addr #0 {
  %3 = alloca %struct.sigaction, align 8
  %4 = bitcast %struct.sigaction* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 152, i8* nonnull %4) #3
  %5 = call i32 @sigaction(i32 noundef %0, %struct.sigaction* noundef null, %struct.sigaction* noundef nonnull %3) #4
  %6 = icmp eq i32 %1, 0
  %7 = getelementptr inbounds %struct.sigaction, %struct.sigaction* %3, i64 0, i32 2
  %8 = load i32, i32* %7, align 8, !tbaa !3
  %9 = and i32 %8, -268435457
  %10 = select i1 %6, i32 268435456, i32 0
  %11 = or i32 %9, %10
  store i32 %11, i32* %7, align 8, !tbaa !3
  %12 = call i32 @sigaction(i32 noundef %0, %struct.sigaction* noundef nonnull %3, %struct.sigaction* noundef null) #4
  call void @llvm.lifetime.end.p0i8(i64 152, i8* nonnull %4) #3
  ret i32 %12
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i32 @sigaction(i32 noundef, %struct.sigaction* noundef, %struct.sigaction* noundef) local_unnamed_addr #2

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
!3 = !{!4, !8, i64 136}
!4 = !{!"sigaction", !5, i64 0, !7, i64 8, !8, i64 136, !9, i64 144}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!"__sigset_t", !5, i64 0}
!8 = !{!"int", !5, i64 0}
!9 = !{!"any pointer", !5, i64 0}
