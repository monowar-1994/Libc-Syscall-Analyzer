; ModuleID = 'src/time/asctime_r.c'
source_filename = "src/time/asctime_r.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type { i8*, i64, [24 x i8], %struct.__locale_map* }
%struct.tm = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i64, i8* }

@.str = private unnamed_addr constant [32 x i8] c"%.3s %.3s%3d %.2d:%.2d:%.2d %d\0A\00", align 1
@__c_locale = external hidden constant %struct.__locale_struct, align 8

@asctime_r = weak alias i8* (%struct.tm*, i8*), i8* (%struct.tm*, i8*)* @__asctime_r

; Function Attrs: nounwind optsize strictfp
define hidden i8* @__asctime_r(%struct.tm* noalias nocapture noundef readonly %0, i8* noalias noundef returned %1) #0 {
  %3 = getelementptr inbounds %struct.tm, %struct.tm* %0, i64 0, i32 6
  %4 = load i32, i32* %3, align 8, !tbaa !3
  %5 = add nsw i32 %4, 131072
  %6 = tail call i8* @__nl_langinfo_l(i32 noundef %5, %struct.__locale_struct* noundef nonnull @__c_locale) #2
  %7 = getelementptr inbounds %struct.tm, %struct.tm* %0, i64 0, i32 4
  %8 = load i32, i32* %7, align 8, !tbaa !10
  %9 = add nsw i32 %8, 131086
  %10 = tail call i8* @__nl_langinfo_l(i32 noundef %9, %struct.__locale_struct* noundef nonnull @__c_locale) #2
  %11 = getelementptr inbounds %struct.tm, %struct.tm* %0, i64 0, i32 3
  %12 = load i32, i32* %11, align 4, !tbaa !11
  %13 = getelementptr inbounds %struct.tm, %struct.tm* %0, i64 0, i32 2
  %14 = load i32, i32* %13, align 8, !tbaa !12
  %15 = getelementptr inbounds %struct.tm, %struct.tm* %0, i64 0, i32 1
  %16 = load i32, i32* %15, align 4, !tbaa !13
  %17 = getelementptr inbounds %struct.tm, %struct.tm* %0, i64 0, i32 0
  %18 = load i32, i32* %17, align 8, !tbaa !14
  %19 = getelementptr inbounds %struct.tm, %struct.tm* %0, i64 0, i32 5
  %20 = load i32, i32* %19, align 4, !tbaa !15
  %21 = add nsw i32 %20, 1900
  %22 = tail call i32 (i8*, i64, i8*, ...) @snprintf(i8* noundef %1, i64 noundef 26, i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8* noundef %6, i8* noundef %10, i32 noundef %12, i32 noundef %14, i32 noundef %16, i32 noundef %18, i32 noundef %21) #2
  %23 = icmp sgt i32 %22, 25
  br i1 %23, label %24, label %25

24:                                               ; preds = %2
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !16
  br label %25

25:                                               ; preds = %24, %2
  ret i8* %1
}

; Function Attrs: optsize
declare i32 @snprintf(i8* noundef, i64 noundef, i8* noundef, ...) local_unnamed_addr #1

; Function Attrs: optsize
declare i8* @__nl_langinfo_l(i32 noundef, %struct.__locale_struct* noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #3 = { nounwind strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !5, i64 24}
!4 = !{!"tm", !5, i64 0, !5, i64 4, !5, i64 8, !5, i64 12, !5, i64 16, !5, i64 20, !5, i64 24, !5, i64 28, !5, i64 32, !8, i64 40, !9, i64 48}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!"long", !6, i64 0}
!9 = !{!"any pointer", !6, i64 0}
!10 = !{!4, !5, i64 16}
!11 = !{!4, !5, i64 12}
!12 = !{!4, !5, i64 8}
!13 = !{!4, !5, i64 4}
!14 = !{!4, !5, i64 0}
!15 = !{!4, !5, i64 20}
!16 = !{i64 262083}
