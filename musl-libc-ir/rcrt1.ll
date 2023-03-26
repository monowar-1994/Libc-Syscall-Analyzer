; ModuleID = 'crt/rcrt1.c'
source_filename = "crt/rcrt1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

module asm ".text "
module asm ".global _start "
module asm "_start: "
module asm "\09xor %rbp,%rbp "
module asm "\09mov %rsp,%rdi "
module asm ".weak _DYNAMIC "
module asm ".hidden _DYNAMIC "
module asm "\09lea _DYNAMIC(%rip),%rsi "
module asm "\09andq $-16,%rsp "
module asm "\09call _start_c "

%struct.Elf64_Phdr = type { i32, i32, i64, i64, i64, i64, i64, i64 }

; Function Attrs: nounwind optsize strictfp
define hidden void @_start_c(i64* noundef %0, i64* noundef %1) local_unnamed_addr #0 {
  %3 = alloca [32 x i64], align 16
  %4 = alloca [32 x i64], align 16
  %5 = bitcast [32 x i64]* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 256, i8* nonnull %5) #3
  %6 = bitcast [32 x i64]* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 256, i8* nonnull %6) #3
  %7 = load i64, i64* %0, align 8, !tbaa !3
  %8 = getelementptr inbounds i64, i64* %0, i64 1
  %9 = shl i64 %7, 32
  %10 = add i64 %9, 4294967296
  %11 = ashr exact i64 %10, 32
  br label %12

12:                                               ; preds = %12, %2
  %13 = phi i64 [ %11, %2 ], [ %18, %12 ]
  %14 = getelementptr inbounds i64, i64* %8, i64 %13
  %15 = bitcast i64* %14 to i8**
  %16 = load i8*, i8** %15, align 8, !tbaa !7
  %17 = icmp eq i8* %16, null
  %18 = add i64 %13, 1
  br i1 %17, label %19, label %12

19:                                               ; preds = %12, %19
  %20 = phi i64 [ %23, %19 ], [ 0, %12 ]
  %21 = getelementptr inbounds [32 x i64], [32 x i64]* %3, i64 0, i64 %20
  %22 = bitcast i64* %21 to <2 x i64>*
  store <2 x i64> zeroinitializer, <2 x i64>* %22, align 16, !tbaa !3
  %23 = add nuw i64 %20, 2
  %24 = icmp eq i64 %23, 32
  br i1 %24, label %25, label %19, !llvm.loop !9

25:                                               ; preds = %19
  %26 = getelementptr inbounds i64, i64* %14, i64 1
  %27 = load i64, i64* %26, align 8, !tbaa !3
  %28 = icmp eq i64 %27, 0
  br i1 %28, label %29, label %36

29:                                               ; preds = %45, %25
  br label %30

30:                                               ; preds = %29, %30
  %31 = phi i64 [ %34, %30 ], [ 0, %29 ]
  %32 = getelementptr inbounds [32 x i64], [32 x i64]* %4, i64 0, i64 %31
  %33 = bitcast i64* %32 to <2 x i64>*
  store <2 x i64> zeroinitializer, <2 x i64>* %33, align 16, !tbaa !3
  %34 = add nuw i64 %31, 2
  %35 = icmp eq i64 %34, 32
  br i1 %35, label %50, label %30, !llvm.loop !11

36:                                               ; preds = %25, %45
  %37 = phi i64 [ %48, %45 ], [ %27, %25 ]
  %38 = phi i64 [ %46, %45 ], [ 0, %25 ]
  %39 = icmp ult i64 %37, 32
  br i1 %39, label %40, label %45

40:                                               ; preds = %36
  %41 = or i64 %38, 1
  %42 = getelementptr inbounds i64, i64* %26, i64 %41
  %43 = load i64, i64* %42, align 8, !tbaa !3
  %44 = getelementptr inbounds [32 x i64], [32 x i64]* %3, i64 0, i64 %37
  store i64 %43, i64* %44, align 8, !tbaa !3
  br label %45

45:                                               ; preds = %36, %40
  %46 = add i64 %38, 2
  %47 = getelementptr inbounds i64, i64* %26, i64 %46
  %48 = load i64, i64* %47, align 8, !tbaa !3
  %49 = icmp eq i64 %48, 0
  br i1 %49, label %29, label %36

50:                                               ; preds = %30
  %51 = load i64, i64* %1, align 8, !tbaa !3
  %52 = icmp eq i64 %51, 0
  br i1 %52, label %67, label %53

53:                                               ; preds = %50, %62
  %54 = phi i64 [ %65, %62 ], [ %51, %50 ]
  %55 = phi i64 [ %63, %62 ], [ 0, %50 ]
  %56 = icmp ult i64 %54, 32
  br i1 %56, label %57, label %62

57:                                               ; preds = %53
  %58 = or i64 %55, 1
  %59 = getelementptr inbounds i64, i64* %1, i64 %58
  %60 = load i64, i64* %59, align 8, !tbaa !3
  %61 = getelementptr inbounds [32 x i64], [32 x i64]* %4, i64 0, i64 %54
  store i64 %60, i64* %61, align 8, !tbaa !3
  br label %62

62:                                               ; preds = %53, %57
  %63 = add i64 %55, 2
  %64 = getelementptr inbounds i64, i64* %1, i64 %63
  %65 = load i64, i64* %64, align 8, !tbaa !3
  %66 = icmp eq i64 %65, 0
  br i1 %66, label %67, label %53

67:                                               ; preds = %62, %50
  %68 = getelementptr inbounds [32 x i64], [32 x i64]* %3, i64 0, i64 7
  %69 = load i64, i64* %68, align 8, !tbaa !3
  %70 = icmp eq i64 %69, 0
  br i1 %70, label %71, label %98

71:                                               ; preds = %67
  %72 = getelementptr inbounds [32 x i64], [32 x i64]* %3, i64 0, i64 5
  %73 = load i64, i64* %72, align 8, !tbaa !3
  %74 = getelementptr inbounds [32 x i64], [32 x i64]* %3, i64 0, i64 4
  %75 = load i64, i64* %74, align 16, !tbaa !3
  %76 = icmp eq i64 %73, 0
  br i1 %76, label %98, label %77

77:                                               ; preds = %71
  %78 = getelementptr inbounds [32 x i64], [32 x i64]* %3, i64 0, i64 3
  %79 = load i64, i64* %78, align 8, !tbaa !3
  %80 = inttoptr i64 %79 to %struct.Elf64_Phdr*
  br label %81

81:                                               ; preds = %77, %93
  %82 = phi i64 [ %84, %93 ], [ %73, %77 ]
  %83 = phi %struct.Elf64_Phdr* [ %96, %93 ], [ %80, %77 ]
  %84 = add i64 %82, -1
  %85 = getelementptr inbounds %struct.Elf64_Phdr, %struct.Elf64_Phdr* %83, i64 0, i32 0
  %86 = load i32, i32* %85, align 8, !tbaa !12
  %87 = icmp eq i32 %86, 2
  br i1 %87, label %88, label %93

88:                                               ; preds = %81
  %89 = ptrtoint i64* %1 to i64
  %90 = getelementptr inbounds %struct.Elf64_Phdr, %struct.Elf64_Phdr* %83, i64 0, i32 3
  %91 = load i64, i64* %90, align 8, !tbaa !15
  %92 = sub i64 %89, %91
  br label %98

93:                                               ; preds = %81
  %94 = bitcast %struct.Elf64_Phdr* %83 to i8*
  %95 = getelementptr inbounds i8, i8* %94, i64 %75
  %96 = bitcast i8* %95 to %struct.Elf64_Phdr*
  %97 = icmp eq i64 %84, 0
  br i1 %97, label %98, label %81

98:                                               ; preds = %93, %71, %88, %67
  %99 = phi i64 [ %69, %67 ], [ %92, %88 ], [ 0, %71 ], [ 0, %93 ]
  %100 = getelementptr inbounds [32 x i64], [32 x i64]* %4, i64 0, i64 18
  %101 = load i64, i64* %100, align 16, !tbaa !3
  %102 = icmp eq i64 %101, 0
  br i1 %102, label %125, label %103

103:                                              ; preds = %98
  %104 = getelementptr inbounds [32 x i64], [32 x i64]* %4, i64 0, i64 17
  %105 = load i64, i64* %104, align 8, !tbaa !3
  %106 = add i64 %105, %99
  %107 = inttoptr i64 %106 to i64*
  br label %108

108:                                              ; preds = %103, %121
  %109 = phi i64* [ %122, %121 ], [ %107, %103 ]
  %110 = phi i64 [ %123, %121 ], [ %101, %103 ]
  %111 = getelementptr inbounds i64, i64* %109, i64 1
  %112 = load i64, i64* %111, align 8, !tbaa !3
  %113 = and i64 %112, 2147483647
  %114 = icmp eq i64 %113, 8
  br i1 %114, label %115, label %121

115:                                              ; preds = %108
  %116 = load i64, i64* %109, align 8, !tbaa !3
  %117 = add i64 %116, %99
  %118 = inttoptr i64 %117 to i64*
  %119 = load i64, i64* %118, align 8, !tbaa !3
  %120 = add i64 %119, %99
  store i64 %120, i64* %118, align 8, !tbaa !3
  br label %121

121:                                              ; preds = %108, %115
  %122 = getelementptr inbounds i64, i64* %109, i64 2
  %123 = add i64 %110, -16
  %124 = icmp eq i64 %123, 0
  br i1 %124, label %125, label %108

125:                                              ; preds = %121, %98
  %126 = getelementptr inbounds [32 x i64], [32 x i64]* %4, i64 0, i64 8
  %127 = load i64, i64* %126, align 16, !tbaa !3
  %128 = icmp eq i64 %127, 0
  br i1 %128, label %152, label %129

129:                                              ; preds = %125
  %130 = getelementptr inbounds [32 x i64], [32 x i64]* %4, i64 0, i64 7
  %131 = load i64, i64* %130, align 8, !tbaa !3
  %132 = add i64 %131, %99
  %133 = inttoptr i64 %132 to i64*
  br label %134

134:                                              ; preds = %129, %148
  %135 = phi i64* [ %149, %148 ], [ %133, %129 ]
  %136 = phi i64 [ %150, %148 ], [ %127, %129 ]
  %137 = getelementptr inbounds i64, i64* %135, i64 1
  %138 = load i64, i64* %137, align 8, !tbaa !3
  %139 = and i64 %138, 2147483647
  %140 = icmp eq i64 %139, 8
  br i1 %140, label %141, label %148

141:                                              ; preds = %134
  %142 = load i64, i64* %135, align 8, !tbaa !3
  %143 = add i64 %142, %99
  %144 = inttoptr i64 %143 to i64*
  %145 = getelementptr inbounds i64, i64* %135, i64 2
  %146 = load i64, i64* %145, align 8, !tbaa !3
  %147 = add i64 %146, %99
  store i64 %147, i64* %144, align 8, !tbaa !3
  br label %148

148:                                              ; preds = %134, %141
  %149 = getelementptr inbounds i64, i64* %135, i64 3
  %150 = add i64 %136, -24
  %151 = icmp eq i64 %150, 0
  br i1 %151, label %152, label %134

152:                                              ; preds = %148, %125
  %153 = tail call void (i8*, i64*)* asm ".hidden __dls2\0A\09lea __dls2(%rip),$0\0A", "=r,~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !16
  %154 = inttoptr i64 %99 to i8*
  tail call void %153(i8* noundef %154, i64* noundef nonnull %0) #4
  call void @llvm.lifetime.end.p0i8(i64 256, i8* nonnull %6) #3
  call void @llvm.lifetime.end.p0i8(i64 256, i8* nonnull %5) #3
  ret void
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind optsize strictfp
define hidden void @__dls2(i8* nocapture noundef readnone %0, i64* noundef %1) local_unnamed_addr #0 {
  %3 = load i64, i64* %1, align 8, !tbaa !3
  %4 = trunc i64 %3 to i32
  %5 = getelementptr inbounds i64, i64* %1, i64 1
  %6 = bitcast i64* %5 to i8**
  %7 = tail call i32 @__libc_start_main(i32 (...)* noundef nonnull @main, i32 noundef %4, i8** noundef nonnull %6, void (...)* noundef @_init, void (...)* noundef @_fini, void (...)* noundef null) #4
  ret void
}

; Function Attrs: optsize
declare i32 @__libc_start_main(i32 (...)* noundef, i32 noundef, i8** noundef, void (...)* noundef, void (...)* noundef, void (...)* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @main(...) #2

; Function Attrs: optsize
declare extern_weak void @_init(...) #2

; Function Attrs: optsize
declare extern_weak void @_fini(...) #2

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
!3 = !{!4, !4, i64 0}
!4 = !{!"long", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !8, i64 0}
!8 = !{!"any pointer", !5, i64 0}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.isvectorized", i32 1}
!11 = distinct !{!11, !10}
!12 = !{!13, !14, i64 0}
!13 = !{!"", !14, i64 0, !14, i64 4, !4, i64 8, !4, i64 16, !4, i64 24, !4, i64 32, !4, i64 40, !4, i64 48}
!14 = !{!"int", !5, i64 0}
!15 = !{!13, !4, i64 16}
!16 = !{i64 2147678038, i64 2147678063}
